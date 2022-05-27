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

function killport() {  
    port=$(lsof -n -i4TCP:$1 | grep LISTEN | awk '{ print $1 }')
    kill -9 $port 
}
