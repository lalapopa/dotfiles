SHELL := /bin/bash

define create_folder 
	if [ ! -d $(1) ]; then \
		mkdir -p $(1); \
	fi;
endef

.PHONY: all
all: download_tools dotfiles 

download_tools: 
	sudo -S apt-get update && sudo -S apt-get -y install vim tmux git xclip ripgrep;
	if [ ! -d "$(HOME)/.vim/bundle/Vundle.vim" ]; then \
		git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim; \
	fi;
	$(call create_folder,"$(HOME)/.config")
	if [ ! -d "$(HOME)/.fzf" ]; then \
		git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf; \
		~/.fzf/install; \
	fi;

dotfiles:
	vim +PluginInstall +qall;
	ln -snf $(CURDIR)/tmux/.tmux.conf $(HOME);
	ln -snf $(CURDIR)/vim/.vimrc $(HOME);
	ln -snf $(CURDIR)/vim/my_snippets $(HOME)/.vim;
	ln -snf $(CURDIR)/bash/.bashrc $(HOME);
	ln -snf $(CURDIR)/bash/.profile $(HOME);
	ln -snf $(CURDIR)/git/.gitconfig $(HOME);
	ln -snf $(CURDIR)/git/.dot-gitignore $(HOME);

