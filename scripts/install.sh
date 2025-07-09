#!/bin/bash

SCRIPT_PATH="$(dirname "$(realpath "$0")")"

##########################################################################
echo "Looking for NodeJS..."
if ! command -v node &> /dev/null; then
    echo "Node.js is not installed. Don't worry, I'll install a maximum light version)"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
    nvm install --lts
    echo "Well done) Now you have a NodeJS)"
else
    echo "NodeJS already exists, that's good. What about Ruby..."
fi
###########################################################################
echo "Looking for Ruby..."
if ! command -v ruby &> /dev/null; then
    echo "Ruby is not installed. Don't worry, I'll install a maximum light version)"
    curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-install | bash
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
    rbenv install 3.1.0
    rbenv global 3.1.0
    echo "Well done) Now you have a Ruby)"
else
    echo "Ruby already exists, fine! How about git?"
fi
###############################################################################
sudo apt install git -y
sudo gem install thor
###############################################################################
sudo chown -R $(whoami) /usr/local/src
git clone https://github.com/LovchikovMark/ProjectFactory.git /usr/local/src/ProjectFactory
cd /usr/local/src/ProjectFactory/scripts || exit
chmod +x add-to-bashrc.sh delete.sh remove-from-bashrc.sh
bash add-to-bashrc.sh
cd ../ || exit
npm i
npm run compile
###############################################################################
echo "alias pf='ruby /usr/local/src/ProjectFactory/cli/cli.rb'" >> ~/.bashrc
source ~/.bashrc
###############################################################################
echo "nice using!)"

rm "$SCRIPT_PATH/install.sh"