SHELL := /usr/bin/bash

.PHONY: all
all: download_tools dotfiles 

download_tools: 
	sudo apt-get update && sudo apt-get -y install vim tmux i3 git fzf rxvt-unicode polybar xclip ripgrep;
	if [ ! -d "$(HOME)/.vim/bundle/Vundle.vim" ]; then \
		git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim; \
	fi;
	if [ ! -d "$(HOME)/.config" ]; then \
		mkdir "$HOME/.config";
	fi;
	if [ ! -d "$(HOME)/.fzf" ]; then \
		git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf; \
		~/.fzf/install; \
	fi;

dotfiles:
	vim +PluginInstall +qall;
	ln -snf $(CURDIR)/i3/.config/i3 $(HOME)/.config/;
	ln -snf $(CURDIR)/polybar/.config/polybar $(HOME)/.config/;
	ln -snf $(CURDIR)/rofi/.config/rofi $(HOME)/.config/;
	ln -snf $(CURDIR)/tmux/.tmux.conf $(HOME);
	ln -snf $(CURDIR)/vim/.vimrc $(HOME);
	ln -snf $(CURDIR)/bash/.bashrc $(HOME);
	ln -snf $(CURDIR)/bash/.profile $(HOME);
	ln -snf $(CURDIR)/urxvt/.Xresources $(HOME);
	ln -snf $(CURDIR)/git/.gitconfig $(HOME);
	ln -snf $(CURDIR)/git/.dot-gitignore $(HOME);

download_font:
	wget https://github.com/be5invis/Iosevka/releases/download/v15.3.1/super-ttc-iosevka-15.3.1.zip -O /tmp/fonts.zip;
	mkdir -p $(HOME)/.local/share/fonts/
	unzip /tmp/fonts.zip -d $(HOME)/.local/share/fonts/
	fc-cache -f -v


