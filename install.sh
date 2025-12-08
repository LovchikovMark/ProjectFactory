#!/bin/bash

echo "Installing ProjectFactory..."

git clone https://github.com/LovchikovMark/ProjectFactory.git ~/.projectfactory

cd ~/.projectfactory

pip install -r req.txt

chmod +x ~/.projectfactory/main.py

sudo ln -sf ~/.projectfactory/main.py /usr/local/bin/pf

if [[ -f ~/.bashrc ]]; then
    echo "alias pf='python ~/.projectfactory/main.py'" >> ~/.bashrc
fi

if [[ -f ~/.zshrc ]]; then
    echo "alias pf='python ~/.projectfactory/main.py'" >> ~/.zshrc
fi

echo "✅ Installation complete!"
echo "Usage: pf [command]"
echo "Restart your terminal or run: source ~/.bashrc"