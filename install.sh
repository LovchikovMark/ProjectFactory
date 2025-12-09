#!/bin/bash

echo "Installing ProjectFactory..."

git clone https://raw.githubusercontent.com/LovchikovMark/ProjectFactory/master/bin/main /usr/local/bin/

if [[ -f ~/.bashrc ]]; then
    echo "alias pf=' bash /usr/local/bin/main'" >> ~/.bashrc
fi

if [[ -f ~/.zshrc ]]; then
    echo "alias pf=' bash /usr/local/bin/main'" >> ~/.zshrc
fi

source ~/.bashrc

echo "✅ Installation complete!"
echo "Usage: pf [command]"