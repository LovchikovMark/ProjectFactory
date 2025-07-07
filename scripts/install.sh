apt install ruby
apt install nodejs
apt install git
gem install thor

#######################

git clone https://github.com/LovchikovMark/ProjectFactory.git /usr/local/src/ProjectFactory
cd /usr/local/src/ProjectFactory
npm i
cd
echo "alias pf='ruby /usr/local/src/ProjectFactory/cli/cli.rb'"

#######################

echo "nice using!)"