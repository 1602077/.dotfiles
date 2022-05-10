#!/bin/zsh

function mkcd(){
    mkdir $1
    cd $1
}

function vimrc(){
    vim ~/.dotfiles/.vimrc
}

function zshrc(){
    vim ~/.dotfiles/.zshrc
}
