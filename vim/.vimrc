set relativenumber
set nu rnu
set laststatus=2
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set scrolloff=8 
set noshowmode

syntax on
set nocompatible              " be iMproved, required
filetype off                  " required

" Disable Arrow keys in Normal mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Undo brake
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ) )<c-g>u
inoremap ( (<c-g>u
inoremap { {<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Moving text 
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==

" Allign view 
noremap n nzzzv 
nnoremap N Nzzzv

" Allign view 
noremap n nzzzv 
nnoremap N Nzzzv

" Copy to clipboard
vnoremap <C-c> "+y

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/ultisnips

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/seoul256.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'lervag/vimtex'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'iamcco/markdown-preview.nvim' 
Plugin 'ferrine/md-img-paste.vim'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'

call vundle#end()            " required
filetype plugin indent on    " required

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-t>"
let g:UltiSnipsEditSplit="vertical"

syntax enable
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk = {
	\ 'build_dir' : '',
	\ 'callback' : 1,
	\ 'continuous' : 1,
	\ 'executable' : 'latexmk',
	\ 'hooks' : [],
	\ 'options' : [
	\   '-verbose',
	\   '-file-line-error',
	\   '-synctex=1',
	\   '-interaction=nonstopmode',
	\	'-shell-escape',
	\ ],
	\}

" inkscape-figure run
inoremap <C-f> <Esc>:!source ~/inkscape_shortcut.sh<CR><CR><Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> <Esc>:!source ~/inkscape_shortcut.sh<CR><CR><Esc>: silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>

" Colorscheme
let g:lightline = {
	\ 'colorscheme': 'PaperColor',
	\ 'active': {
	\   'right': [ [ 'percent' ],
	\              [ 'lineinfo' ],
	\              [ 'fileformat', 'fileencoding', 'filetype'] ]
	\ },
	\ }

let g:seoul256_background = 234
colo seoul256

" Image2markdown
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
let g:mdip_imgdir = 'figures'
let g:mdip_imgname = 'img'



" Background transparent 
hi Normal guibg=NONE ctermbg=NONE

