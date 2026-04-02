#!/bin/bash

echo "Installing ProjectFactory..."

curl -O https://raw.githubusercontent.com/LovchikovMark/ProjectFactory/master/bin/pf && sudo mv pf /usr/local/bin/
mkdir ~/.config/pf

sudo chmod +x /usr/local/bin/pf

if [[ -f ~/.bashrc ]]; then
    echo "alias pf='/usr/local/bin/pf'" >> ~/.bashrc
    source ~/.bashrc
fi

if [[ -f ~/.zshrc ]]; then
    echo "alias pf='/usr/local/bin/pf'" >> ~/.zshrc
    source ~/.zshrc
fi

echo "✅ Installation complete!"
echo "Usage: pf [command]"