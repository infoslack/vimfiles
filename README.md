#Vim
My clean configuration for Vim

###Plugins

* [Ack](http://www.vim.org/scripts/script.php?script_id=2572)
* [bufexplorer](http://www.vim.org/scripts/script.php?script_id=42)
* [fugitive](http://www.vim.org/scripts/script.php?script_id=2975)
* [html5.vim](https://github.com/othree/html5.vim)
* [markdown](http://www.vim.org/scripts/script.php?script_id=1242)
* [rails](http://www.vim.org/scripts/script.php?script_id=1567)
* [snipemate](https://github.com/akitaonrails/snipmate.vim)
* [supertab](http://www.vim.org/scripts/script.php?script_id=1643)
* [syntastic](http://www.vim.org/scripts/script.php?script_id=2736)
* [vim-jquery](https://github.com/itspriddle/vim-jquery)
* [vim-ruby-sinatra](https://github.com/hallison/vim-ruby-sinatra)
* [vim-ruby](https://github.com/vim-ruby/vim-ruby)
* [webapi-vim](https://github.com/mattn/webapi-vim)

##Installation

Clone this repo into your home directory either as .vim

        git clone git@github.com:infoslack/vimfiles.git ~/.vim

Then 'cd' into the repo and run this to get the snippets submodule:

        git submodule update --init

Now you should create a new .vimrc file in your home directory that loads
the pre-configured one that comes bundled in this package.

        echo "source ~/.vim/vimrc" > ~/.vimrc
        echo "source ~/.vim/gvimrc" > ~/.gvimrc
