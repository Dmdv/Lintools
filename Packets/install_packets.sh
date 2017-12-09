#!/usr/bin/env bash

GOARCH="go1.9.2.linux-amd64.tar.gz"
GOLINK="https://storage.googleapis.com/golang/"${GOARCH}

sudo apt update
sudo apt -y upgrade
sudo apt-get install -y libncurses5-dev
sudo apt-get install -y libncursesw5-dev
sudo apt-get install -y libssl-dev
sudo apt-get install -y libreadline-dev
sudo apt-get install -y autoconf
sudo apt-get install -y linux-headers-$(uname -r)
sudo apt-get install -y build-essential
sudo apt-get install -y nmap
sudo apt-get install -y dialog
sudo apt-get install -y activity-log-manager
sudo apt-get install -y aptitude
sudo apt-get install -y mpd
sudo apt-get install -y cantata
sudo apt-get install -y checkinstall
sudo apt-get install -y cpulimit
sudo apt-get install -y cryptsetup
sudo apt-get install -y doublecmd-gtk
sudo apt-get install -y geany
sudo apt-get install -y git
sudo apt-get install -y google-chrome-stable
sudo apt-get install -y gparted
sudo apt-get install -y gsmartcontrol
sudo apt-get install -y iotop
sudo apt-get install -y nautilus-dropbox
sudo apt-get install -y net-tools
sudo apt-get install -y pkg-config
sudo apt-get install -y scrub
sudo apt-get install -y skypeforlinux
sudo apt-get install -y smartmontools
sudo apt-get install -y sonata
sudo apt-get install -y synaptic
sudo apt-get install -y telegram-desktop
sudo apt-get install -y unrar
sudo apt-get install -y xarchiver
sudo apt-get install -y virtualbox
sudo apt-get install -y vagrant
sudo apt-get install -y mc
sudo apt-get install -y elinks
sudo apt-get install -y htop
sudo apt-get install -y curl
sudo apt-get install -y elinks
sudo apt-get install -y calibre
sudo apt-get install -y bleachbit
sudo apt-get install -y mpv

echo "===== Instaling Visual Studio Code ======="

curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get update
sudo apt-get install code # or code-insiders

echo "===== Instaling Rust ======="

# curl -sf -L https://static.rust-lang.org/rustup.sh | sh
sudo curl -f -L https://static.rust-lang.org/rustup.sh -O
sudo sh rustup.sh

echo "===== Installing GO ========"

sudo wget ${GOLINK}
sudo tar -C /usr/local -xzf ${GOARCH}
sudo rm -rf ${GOARCH}
export PATH=$PATH:/usr/local/go/bin # export path
sudo echo 'export PATH=$PATH:/usr/local/go/bin' | sudo tee -a /etc/profile # add path to global profile
source /etc/profile # refresh profile
sudo mkdir $HOME/go

echo "===== Installing Erlang & Elixir ====="

# see also https://www.erlang-solutions.com/resources/download.html
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
sudo dpkg -i erlang-solutions_1.0_all.deb
sudo apt-get -y update
sudo apt-get install -y erlang
# sudo apt-get install -y esl-erlang
sudo apt-get install -y elixir
mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez

#Uncomment if you install it from Ubuntu

#echo "===== Instaling Unity Tweak Tool ======="
#sudo apt-get install -y gnome-tweak-tool
#sudo apt-get install -y notify-osd
#sudo apt-get install -y unity-tweak-tool
#echo "===== Installing Numix Theme ======"
#sudo add-apt-repository ppa:numix/ppa
#sudo apt-get update
#sudo apt-get install numix-gtk-theme numix-icon-theme numix-icon-theme-circle
#unity-tweak-tool

#sudo apt-get -y autoremove # delete orphaned packets
