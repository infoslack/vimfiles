"Initialize
set nocompatible
filetype off

"Vundle init
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

"Plugins
Plugin 'altercation/vim-colors-solarized'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'stephpy/vim-yaml'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-ruby/vim-ruby'
Plugin 'infoslack/vim-docker'
Plugin 'fatih/vim-go'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/emmet-vim'
call vundle#end()
filetype plugin indent on

"General
set encoding=utf-8
set number                      "add line numbers
set backspace=indent,eol,start  "allow backspace in insert mode
set history=1000                "store lots of :cmdline history
set showcmd                     "show incomplete cmds down the bottom
set showmode                    "show current mode down the bottom
set visualbell                  "no sounds
set autoread                    "reload files changed outside vim
set copyindent
set laststatus=2
set statusline=%f
set noundofile

"Indentation
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
set hidden

"Syntax
syntax enable
autocmd FileType ruby     set et sw=2 ts=2 sts=2
autocmd FileType Gemfile  set ft=ruby
autocmd FileType yaml     set et sw=2 ts=2 sts=2
autocmd FileType css      set et sw=2 ts=2 sts=2
autocmd FileType python   set et sw=4 ts=4 sts=4
autocmd FileType Makefile set et sw=4 ts=4 sts=4
autocmd FileType go       set et sw=4 ts=4 sts=4
autocmd FileType sh       set et sw=4 ts=4 sts=4
autocmd FileType c        set et sw=4 ts=4 sts=4
autocmd FileType markdown set et sw=4 ts=4 sts=4
autocmd FileType asm      set et sw=8 ts=8 sts=8
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

"Turn Off Swap Files
set noswapfile
set nobackup
set nowb

"Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·
set nowrap       "Don't wrap lines
set wrap linebreak nolist

"Folds
set foldmethod=indent
set foldnestmax=3
set nofoldenable

"Completion
set wildmode=list:longest
set wildmenu                "on ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

"Scrolling
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

"Color scheme
if $COLORTERM == 'gnome-terminal'
  set term=gnome-256color
  set background=light
  colorscheme molokai
else
  if $TERM == 'xterm'
    set term=xterm-256color
    set background=dark
    colorscheme solarized
  endif
endif

"map to bufexplorer
nnoremap <leader>b :BufExplorer<cr>

"bindings for ragtag
inoremap <M-o>    <Esc>o
inoremap <C-j>    <Down>
let g:ragtag_global_maps = 1

"mark syntax errors with :signs
let g:syntastic_enable_signs=1

"create tabs
nmap <leader>t :tabnew<CR>

"column limit 80 chars
if exists('+colorcolumn')
  set colorcolumn=80
endif

"disable arrow keys
noremap <Up>    :echo "NOP!"<cr>
noremap <Down>  :echo "NOP!"<cr>
noremap <Left>  :echo "NOP!"<cr>
noremap <Right> :echo "NOP!"<cr>
