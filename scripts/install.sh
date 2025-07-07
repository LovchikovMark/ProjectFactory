#######################
apt install git

echo "Looking for NodeJS..."
if ! command -v node &> /dev/null; then
    echo "Node.js is not installed. Don't worry, I'll install a maximum light version)"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
    nvm install --lts
    echo "Well done) Now you have a NodeJS)"
else
    echo "NodeJS already exist, that's good. What about ruby..."

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
    echo "Ruby already exist, fine! How about git?"
fi

gem install thor

#######################

git clone https://github.com/LovchikovMark/ProjectFactory.git /usr/local/src/ProjectFactory
cd /usr/local/src/ProjectFactory/scripts
chmod +x add-to-bashrc.sh
chmod +x delete.sh
chmod +x remove-from-bashrc.sh
bash add-to-bashrc.sh
cd ../
npm run compile

#######################

echo "nice using!)"

#######################