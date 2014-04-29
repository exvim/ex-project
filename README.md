- - -
- [Intro](#intro)
- [Requirements](#requirements)
- [Installation](#installation)
  - [Install ex-utility](#install-ex-utility)
  - [Install ex-project](#install-ex-project)
- [Usage](#usage)

For more details, check [exVim's Docs: Project Window](http://exvim.github.io/docs/project-window)

- - -

# Intro

ex-project is a file browser focus on your current working directory. It provides a tree view
window and allow you to manipulate folders and files directly in it. 

Many Vim users thought ex-project is yet another NERDTree. But actually they have different scope. 
ex-project is more focus on your current project ( or working directory ). It provides folder
and file filter with it and building the whole project tree very fast first time you working the
project. It also allow you create folders, files directly in the tree view window. 

More over that, ex-project can be working with NERDTree seamlessly by its window swapping functions.

![ex-project-window](http://exvim.github.io/images/ext/ex-project-window.png)

ex-project is also a part of [exVim](https://github.com/exvim/main) project.

## Requirements

- Vim 6.0 or higher.
- [exvim/ex-utility](https://github.com/exvim/ex-utility) 

## Installation

### Install ex-utility

ex-project is written based on [exvim/ex-utility](https://github.com/exvim/ex-utility). This 
is the basic library of ex-vim-plugins. Follow the readme file in ex-utility to install it first.

### Install ex-project

ex-project follows the standard runtime path structure, and as such it can 
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

Open your Vim, type `:EXProject your_project_file.exproject` create your project.
Go to the project window and type `<leader>R` to build the project tree. Now you 
can start your project!

More details, check [exVim's Docs: Project-Window Usage](http://exvim.github.io/docs/project-window/) 
and `:help exproject` in Vim.

