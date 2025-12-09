#!/bin/bash

echo "Installing ProjectFactory..."

curl -O https://raw.githubusercontent.com/LovchikovMark/ProjectFactory/master/bin/main && mv main /usr/local/bin/

sudo chmod +x /usr/local/bin/main

if [[ -f ~/.bashrc ]]; then
    echo "alias pf='/usr/local/bin/main'" >> ~/.bashrc
fi

if [[ -f ~/.zshrc ]]; then
    echo "alias pf='/usr/local/bin/main'" >> ~/.zshrc
fi

echo "✅ Installation complete!"
echo "Usage: pf [command]"