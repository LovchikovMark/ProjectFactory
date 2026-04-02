#!/bin/bash

echo "Installing ProjectFactory..."

sudo curl -o /usr/local/bin/pf https://github.com/LovchikovMark/ProjectFactory/releases/latest/download/pf
mkdir ~/.config/pf

sudo chmod +x /usr/local/bin/pf

echo "✅ Installation complete!"
echo "Usage: pf [command]"