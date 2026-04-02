#!/bin/bash

echo "Installing ProjectFactory..."

sudo curl -o /usr/local/bin/pf https://raw.githubusercontent.com/LovchikovMark/ProjectFactory/master/bin/pf
mkdir ~/.config/pf

sudo chmod +x /usr/local/bin/pf

echo "✅ Installation complete!"
echo "Usage: pf [command]"