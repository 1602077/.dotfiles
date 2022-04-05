#!/bin/zsh
echo "\n>> RUNNING ANSIBLE BOOTSTRAP\n"

if [[ $(command -v brew) == "" ]]; then
    echo ">> INSTALLING BREW..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo ">> UPDATING BREW..."
    brew update && brew upgrade && brew cleanup
fi

if [ ! -d "$HOME/.dotfiles/" ]; then
    echo ">> DOWNLOADING DOTFILES FROM GITHHUB..."
    cd ~
    brew install wget
    wget https://github.com/1602077/.dotfiles/archive/main.zip
    unzip main.zip && rm main.zip
    mv .dotfiles-ansible .dotfiles
fi

brew install ansible
ansible-playbook -i ./hosts ~/.dotfiles/ansible/setup.yml --verbose
