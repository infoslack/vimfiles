"Initialize
set nocompatible
filetype off

"Vundle init
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

"Plugins
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/indentpython.vim'

Plugin 'arcticicestudio/nord-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'stephpy/vim-yaml'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-syntastic/syntastic'
Plugin 'infoslack/vim-docker'
Plugin 'fatih/vim-go'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/emmet-vim'
Plugin 'hashivim/vim-terraform'
Plugin 'ervandew/supertab'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plugin 'junegunn/fzf.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'Raimondi/delimitMate'
call vundle#end()
filetype plugin indent on
set ttyfast

"General
set encoding=utf-8
set laststatus=2
set autoread
set autoindent
set backspace=indent,eol,start
set incsearch
set hlsearch
set noerrorbells
set number
set showcmd
set noswapfile
set nobackup
set splitright
set splitbelow
set autowrite
set hidden
set wildmenu
set fileformats=unix,dos,mac
set noshowmatch
set noshowmode
set ignorecase
set smartcase
set completeopt=menu,menuone
set nocursorcolumn
set nocursorline
set updatetime=300
set pumheight=10
set conceallevel=2
set shortmess+=c
set belloff+=ctrlg
set lazyredraw
set maxmempattern=20000
set viminfo='1000

"Color
syntax enable
set t_Co=256
set background=dark
colorscheme nord

"FileType
augroup filetypedetect
  command! -nargs=* -complete=help Help vertical belowright help <args>
  autocmd FileType help wincmd L

  autocmd BufNewFile,BufRead .nginx.conf*,nginx.conf* setf nginx
  autocmd BufRead,BufNewFile *.gotmpl set filetype=gotexttmpl

  autocmd BufNewFile,BufRead *.txt setlocal noet ts=4 sw=4
  autocmd BufNewFile,BufRead *.md setlocal noet ts=4 sw=4
  autocmd BufNewFile,BufRead *.md setlocal noet ts=4 sw=4
  autocmd BufNewFile,BufRead *.html setlocal noet ts=4 sw=4
  autocmd BufNewFile,BufRead *.vim setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.sh setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.proto setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.py setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 textwidth=79

  autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4
  autocmd FileType yaml setlocal expandtab shiftwidth=2 tabstop=2
  autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2
  autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
augroup END

let mapleader = ","

"FZF
let g:fzf_command_prefix = 'Fzf'
let g:fzf_layout = { 'down': '~20%' }

" search
nmap <C-p> :FzfHistory<cr>
imap <C-p> <esc>:<C-u>FzfHistory<cr>

" search across files in the current directory
nmap <C-b> :FzfFiles<cr>
imap <C-b> <esc>:<C-u>FzfFiles<cr>

let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
  \ -g "!{.git,node_modules,vendor}/*" '

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

"AG
let g:ackprg = 'ag --vimgrep --smart-case'
nnoremap \ :Ack<SPACE>

"Up and down by default (and use gj gk to go quicker)
noremap gk <PageUp>
noremap gj <PageDown>

"SuperTab and Ultisnips
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"NerdTree
noremap <Leader>n :NERDTreeToggle<cr>
noremap <Leader>f :NERDTreeFind<cr>
let NERDTreeShowHidden=1

"DelimitMate
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_expand_inside_quotes = 0
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'

"Whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=0

"Bindings for ragtag
inoremap <M-o>    <Esc>o
inoremap <C-j>    <Down>
let g:ragtag_global_maps = 1

"Mark syntax errors with :signs
let g:syntastic_enable_signs=1

"Create tabs
nmap <leader>t :tabnew<CR>

"Disable arrow keys
noremap <Up>    :echo "NOP!"<cr>
noremap <Down>  :echo "NOP!"<cr>
noremap <Left>  :echo "NOP!"<cr>
noremap <Right> :echo "NOP!"<cr>
