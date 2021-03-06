# Avoid Mysql Installation Prompt
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'

# Language Settings
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
locale-gen en_US.UTF-8

# Add Repository
sudo apt-get -y -q install python-software-properties
sudo add-apt-repository ppa:pi-rho/dev
sudo apt-get update

# install basic unix packages
sudo apt-get install -y -q \
  bash-completion \
  build-essential \
  curl \
  git \
  libmysqlclient-dev \
  libcurl3-dev \
  libxslt-dev \
  libxml2-dev \
  mysql-server \
  nodejs \
  nginx \
  rake \
  screen \
  tree \
  tmux \
  vim \
  wget

#configure app env
su -c 'sudo mkdir /var/www && sudo chmod 777 -R /var/www;' vagrant
su -c 'sudo ln -s /var/www ~/www;' vagrant

#remove vagrant default ruby and install rvm
su -c 'sudo rm -rf /opt/vagrant_ruby/ && \curl -sSL https://get.rvm.io | bash -s stable --rails --ruby=2.1.1;' vagrant


#install ruby deps for bundle
sudo apt-get install -y -q \
ruby-dev \
libsqlite3-dev

#install bundle
sudo gem install bundle

#pssh / portly
sudo gem install pssh

#debug 
su -c 'pwd;' vagrant

#bundle install
su -c 'cd ~/www/party_square && bundle install;' vagrant

#get progect files
#su -c 'cd ~/www && git clone https://github.com/rumblefishinc/party_square;' vagrant

#start unicorn
su -c 'cd ~/www/party_square && unicorn;' vagrant

#clone dotfiles
# su -c 'git clone https://github.com/riftrid3r/dotfiles.git ~/.dotfiles && cd ~/.dotfiles && rake install;' vagrant

#install vundle
#TODO: BundleInstall must run in a screen
# su -c 'mkdir -p ~/.vim/bundle' vagrant
# su -c 'git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle && vim +BundleInstall +qall;' vagrant
# su -c 'clear' vagrant

exit
