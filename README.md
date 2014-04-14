# Intro

ex-project is a file browser focus on your current working directory. It provides a tree view
window and allow you to manipulate folders and files directly in it. 

Many Vim users thought ex-project might be another NERDTree. But they have different scope. 
ex-project is more focus on your current project ( or working directory ). It provides folder
and file filter with it and building the whole project tree very fast first time you working the
project. It also allow you create folders, files directly in the tree view window. 

More on that, ex-project can be working with NERDTree by its swap function. With it, you are
freely change the plugin window betwee ex-project and NERDTree.

![ex-project-window](http://exvim.github.io/images/ext/ex-project-window.png)

## Requirements

- Vim 6.0 or higher.
- [exvim/ex-utility](https://github.com/exvim/ex-utility) 

## Installation

This plugin follows the standard runtime path structure, and as such it can 
be installed with a variety of plugin managers:
    
To install using [Vundle](https://github.com/gmarik/vundle):

    # add this line to your .vimrc file
    Bundle 'exvim/ex-project'

To install using [Pathogen](https://github.com/tpope/vim-pathogen):

    cd ~/.vim/bundle
    git clone https://github.com/exvim/ex-project

To install using [NeoBundle](https://github.com/Shougo/neobundle.vim):

    # add this line to your .vimrc file
    NeoBundle 'exvim/ex-project'

[Download zip file](https://github.com/exvim/ex-project/archive/master.zip):

    cd ~/.vim
    unzip ex-project-master.zip
    copy all of the files into your ~/.vim directory

## Usage

