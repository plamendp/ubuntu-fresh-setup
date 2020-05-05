#!/bin/bash

NODEJS_VERSION=12
SLACK_VERSION=4.4.2
INSTALL_WINE=YES
INSTALL_SKYPE=YES


sudo dpkg --add-architecture i386
sudo apt update

# Required by some packages and package management itself
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common 

# Various tools/utils 
sudo apt install -y gparted vim mc synaptic iputils-ping inetutils-traceroute dconf-editor net-tools

# Wine
if [[ "${INSTALL_WINE}" == "YES" ]]; then
  sudo apt install -y wine64 wine32
fi

# nodejs
curl -sL https://deb.nodesource.com/setup_${NODEJS_VERSION}.x | sudo -E bash -
sudo apt-get install -y nodejs

# docker (this will install docker.io as a dependancy)
# As of Ubuntu 20.04 docker.io package is more up to date
sudo apt install -y docker-compose

# Sublime
curl -fsSL https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add
sudo add-apt-repository "deb https://download.sublimetext.com/ apt/stable/"
sudo apt update
sudo apt install -y sublime-text

# Smartgit
curl -fsSL https://www.syntevo.com/downloads/smartgit/smartgit-20_1_1.deb > ~/Downloads/smartgit.deb 
sudo dpkg -i ~/Downloads/smartgit.deb


# Postman
sudo snap install postman

# Slack
curl -fsSL https://downloads.slack-edge.com/linux_releases/slack-desktop-${SLACK_VERSION}-amd64.deb > ~/Downloads/slack.deb 
sudo apt install -y ~/Downloads/slack.deb


# Gnome tweak
sudo apt install -y gnome-tweak-tool

# Java (OpenJDK)
sudo apt install -y default-jre


# AWS CLI v2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
mv awscliv2.zip ~/Downloads
unzip ~/Downloads/awscliv2.zip -d ~/Downloads
sudo ~/Downloads/aws/install

# Skype
if [[ "${INSTALL_SKYPE}" == "YES" ]]; then
  sudo snap install skype --classic
fi

# VLC
sudo apt install -y vlc


# SSH Server
sudo apt install -y openssh-server



#
# Various configuration files
#

# VIM
cat << __T__ | sudo tee /etc/vim/vimrc.local
set showcmd            " Show (partial) command in status line.
set showmatch          " Show matching brackets.
set ignorecase         " Do case insensitive matching
set incsearch          " Incremental search
"set autowrite          " Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a            " Enable mouse usage (all modes)
"set number
__T__


# Increase watch-files number (requires restart)
cat << __T__ | sudo tee -a /etc/sysctl.conf

# Because of projects having way too many files to watch (e.g. Angular)
fs.inotify.max_user_watches=524288
__T__

# NPM "global": we set npm global to be in the user home directory, .npm-global
cat << __T__ | tee ~/.npmrc
prefix=~/.npm-global
__T__


# NPM "global": add bin to PATH
# Note please variables are NOT expanded here!
cat << '__T__' | tee -a ~/.profile

export PATH=~/.npm-global/bin:$PATH
__T__


# Make "more/less" case insensitive and add that nice Midnight Commander alias/wrapper
cat << __T__ | sudo tee -a /etc/bash.bashrc

export LESS="-IR"
alias mc='. /usr/share/mc/bin/mc-wrapper.sh'
__T__


# Disable root over ssh and plain text password login (onlu non root and only with ssh keys)
cat << __T__ | sudo tee -a /etc/ssh/sshd_config.d/001-local.conf

PermitRootLogin no
PasswordAuthentication no
__T__

