"Set utf-8 as default encoding
set encoding=utf8

"necessary on some Linux distros for pathogen to properly load bundles
filetype on
filetype off

"load pathogen managed plugins
call pathogen#infect()

"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible

"General
set number                      "add line numbers
set backspace=indent,eol,start  "allow backspace in insert mode
set history=1000                "store lots of :cmdline history
set showcmd                     "show incomplete cmds down the bottom
set showmode                    "show current mode down the bottom
set visualbell                  "no sounds
set autoread                    "reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
set hidden

"Turn on syntax highlighting
syntax on

"Turn Off Swap Files
set noswapfile
set nobackup
set nowb

"Indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

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

"set terminal color scheme
let g:CSApprox_loaded = 1
if $COLORTERM == 'gnome-terminal'
  set term=gnome-256color
  set background=dark
  colorscheme molokai
else
  if $TERM == 'xterm'
    set  term=xterm-256color
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
  source ~/.vim/snippets/support_functions.vim
catch
  source ~/vimfiles/snippets/support_functions.vim
endtry

autocmd vimenter * call s:SetupSnippets()
function! s:SetupSnippets()

  "if we're in a rails env then read in the rails snippets
  if filereadable("./config/environment.rb")
    try
      call ExtractSnips("~/.vim/snippets/ruby-rails", "ruby")
      call ExtractSnips("~/.vim/snippets/eruby-rails", "eruby")
    catch
      call ExtractSnips("~/vimfiles/snippets/ruby-rails", "ruby")
      call ExtractSnips("~/vimfiles/snippets/eruby-rails", "eruby")
    endtry
  endif

  try
    call ExtractSnips("~/.vim/snippets/html", "eruby")
    call ExtractSnips("~/.vim/snippets/html", "xhtml")
    call ExtractSnips("~/.vim/snippets/html", "php")
  catch
    call ExtractSnips("~/vimfiles/snippets/html", "eruby")
    call ExtractSnips("~/vimfiles/snippets/html", "xhtml")
    call ExtractSnips("~/vimfiles/snippets/html", "php")
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
