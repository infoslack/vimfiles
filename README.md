# Infoslack Vim
My clean configuration for Vim

## Installation

Clone this repo into your home directory either as .vim

        $ git clone https://github.com/infoslack/vimfiles.git ~/.vim

Then 'cd' into the repo and run make:

        $ cd ~/.vim
        $ make

Now you should create a new .vimrc file in your home directory that loads
the pre-configured one that comes bundled in this package. See this [example](https://github.com/infoslack/dotfiles/blob/master/dot/vimrc).

        $ echo "source ~/.vim/vimrc" > ~/.vimrc
