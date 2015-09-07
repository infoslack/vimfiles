"Initialize
set nocompatible
filetype off

"Vundle init
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

"Plugins
Bundle 'altercation/vim-colors-solarized'
Bundle 'infoslack/snipmate-snippets'
Bundle 'ntpeters/vim-better-whitespace'
Bundle 'jlanzarotta/bufexplorer'
Bundle 'ervandew/snipmate.vim'
Bundle 'ervandew/supertab'
Bundle 'bling/vim-airline'
Bundle 'rking/ag.vim'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-endwise'
Bundle 'scrooloose/syntastic'
Bundle 'vim-ruby/vim-ruby'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/emmet-vim'
Bundle 'vinibaggio/vim-tubaina'
Bundle 'ekalinin/Dockerfile.vim'
Bundle 'Glench/Vim-Jinja2-Syntax'
Bundle 'fatih/vim-go'

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
syntax on
autocmd FileType ruby     set et sw=2 ts=2 sts=2
autocmd FileType Gemfile  set ft=ruby
autocmd FileType yaml     set et sw=2 ts=2 sts=2
autocmd FileType css      set et sw=2 ts=2 sts=2
autocmd FileType python   set et sw=4 ts=4 sts=4
autocmd FileType Makefile set et sw=4 ts=4 sts=4
autocmd FileType go       set et sw=4 ts=4 sts=4
autocmd FileType c        set et sw=4 ts=4 sts=4
autocmd FileType markdown set et sw=4 ts=4 sts=4
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

"Snipmate setup
try
  source ~/.vim/bundle/snipmate-snippets/support_functions.vim
catch
  source ~/vimfiles/snippets/support_functions.vim
endtry

autocmd vimenter * call s:SetupSnippets()
function! s:SetupSnippets()

  "if we're in a rails env then read in the rails snippets
  if filereadable("./config/environment.rb")
    try
      call ExtractSnips("~/.vim/bundle/snipmate-snippets/ruby-rails", "ruby")
      call ExtractSnips("~/.vim/bundle/snipmate-snippets/eruby-rails", "eruby")
    catch
      call ExtractSnips("~/vimfiles/bundle/snipmate-snippets/ruby-rails", "ruby")
      call ExtractSnips("~/vimfiles/bundle/snipmate-snippets/eruby-rails", "eruby")
    endtry
  endif

  try
    call ExtractSnips("~/.vim/bundle/snipmate-snippets/html", "eruby")
    call ExtractSnips("~/.vim/bundle/snipmate-snippets/html", "xhtml")
    call ExtractSnips("~/.vim/bundle/snipmate-snippets/html", "php")
  catch
    call ExtractSnips("~/vimfiles/bundle/snipmate-snippets/html", "eruby")
    call ExtractSnips("~/vimfiles/bundle/snipmate-snippets/html", "xhtml")
    call ExtractSnips("~/vimfiles/bundle/snipmate-snippets/html", "php")
  endtry
endfunction

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
