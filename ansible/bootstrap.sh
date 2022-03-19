#!/bin/zsh
echo "\n>> RUNNING ANSIBLE BOOTSTRAP\n"

if [[ $(command -v brew) == "" ]]; then
    echo ">> INSTALLING BREW..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo ">> UPDATING BREW..."
    # brew update && brew upgrade && brew cleanup
fi

if [ ! -d "$HOME/.dotfiles/" ]; then
    echo ">> DOWNLOADING DOTFILES FROM GITHHUB..."
    cd ~
    brew install wget
    # change ansible.zip to main.zip on submitting pr 
    wget https://github.com/1602077/.dotfiles/archive/ansible.zip
    unzip ansible.zip && rm ansible.zip
    mv .dotfiles-ansible .dotfiles
    zsh ~/.dotfiles/symlinks.sh
fi

brew install ansible
ansible-playbook -i ./hosts setup.yml --verbose
zsh ~/.dotfiles/symlinks.sh
