set relativenumber
set nu rnu
set laststatus=2
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set scrolloff=8 
set noshowmode
set cc=80
syntax on

set nocompatible              " be iMproved, required
filetype off                  " required

" Runtimepath 
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/ultisnips
set rtp+=~/.vim/my_snippets


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
Plugin 'chrisbra/csv.vim'
Plugin 'reedes/vim-lexical'
Plugin 'psf/black'
Plugin 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
Plugin 'ap/vim-css-color'

call vundle#end()            " required
filetype plugin indent on    " required

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-t>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]

" vimtex
syntax enable
let g:vimtex_quickfix_open_on_warning = 0
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


" Statusbar 
let g:lightline = {
	\ 'colorscheme': 'seoul256',
	\ 'active': {
	\   'right': [ [ 'percent' ],
	\              [ 'lineinfo' ],
	\              [ 'fileformat', 'fileencoding', 'filetype'] ],
    \
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'readonly', 'filename', 'gitbranch', 'modified' ] ]
    \},
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead'
    \ },
    \ 'mode_map': {
    \ 'n' : 'N',
    \ 'i' : 'I',
    \ 'R' : 'R',
    \ 'v' : 'V',
    \ 'V' : 'VL',
    \ "\<C-v>": 'VB',
    \ 'c' : 'C',
    \ 's' : 'S',
    \ 'S' : 'SL',
    \ "\<C-s>": 'SB',
    \ 't': 'T',
    \ },
    \ }

" Colorscheme 
let g:seoul256_srgb = 1
let g:seoul256_background = 234
colo seoul256

" Markdown screenshots
let g:mdip_imgdir = 'figures'
let g:mdip_imgname = 'img'

" FZF setting 
let g:fzf_layout = { 'down': '30%' }
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

function! Format_line(line)
    let file = split(a:line, ":")[0]
    let isosec = matchstr(file, '\d*')
    let file_header = trim(trim(system(printf("head -1 %s", file))), "# ")
    let input_string = printf("* [%s](\/%s\/) %s", isosec, isosec, file_header)
    execute 'normal! a'.input_string
endfunction

" spell-check
let g:spellfile_URL = 'https://ftp.nluug.nl/vim/runtime/spell'
let g:lexical#spelllang = ['en_us','ru']

augroup lexical
  autocmd!
  autocmd FileType markdown,mkd call lexical#init()
  autocmd FileType tex call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END

" Black 
augroup black_on_save
    autocmd!
    autocmd BufWritePre *.py Black
augroup end

""""""""""""""
"  mappings  "
""""""""""""""

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

"""""""""""""""""""
"  some commands  "
"""""""""""""""""""

" inkscape-figure run
autocmd FileType tex inoremap <C-f> <Esc>:!source ~/.dotfiles/scripts/inkscape_shortcut.sh<CR><CR><Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
autocmd FileType tex nnoremap <C-f> <Esc>:!source ~/.dotfiles/scripts/inkscape_shortcut.sh<CR><CR><Esc>: silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>

" Image2markdown
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
autocmd FileType markdown nnoremap <Leader>ll :MarkdownPreview<CR>

" FZF
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <C-t> :Files<CR>
autocmd FileType markdown nnoremap <Leader>r :call fzf#run({'source': 'rg -n ^ --color always', 'options': '--ansi --delimiter : --nth 3.. --preview "bat --style=full --color=always --highlight-line {2} {1}"', 'window': { 'width': 0.9, 'height': 0.6 }, 'sink': function('Format_line'), })<CR>

" Change indent for html, css  
autocmd BufRead,BufNewFile *.htm,*.html,*.css setlocal tabstop=2 shiftwidth=2 softtabstop=2

" Bracey
autocmd FileType html nnoremap <Leader>ll :Bracey<CR>

" Background transparent 
hi Normal guibg=NONE ctermbg=NONE

