#!/usr/bin/env bash
# Get the latest link from here: https://golang.org/dl/
GOARCH="go1.11.2.linux-amd64.tar.gz"
GOLINK="https://dl.google.com/go/"${GOARCH}

sudo apt update
sudo apt -y upgrade
sudo apt install -y automake
sudo apt install -y ubuntu-make
sudo apt-get install -y systemctl
sudo apt-get install -y libncurses5-dev
sudo apt-get install -y libncursesw5-dev
sudo apt-get install -y libssl-dev
sudo apt-get install -y libreadline-dev
sudo apt-get install -y libevent-dev
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
sudo apt-get install -y apt-transport-https
sudo apt-get install -y ca-certificates
sudo apt-get install -y curl
sudo apt-get install -y software-properties-common
# start file managers
sudo apt-get install -y mc
sudo apt-get install -y tuxcmd
sudo apt-get install -y doublecmd-gtk
sudo apt-get install -y lfm
sudo apt-get install -y ranger
# end
sudo apt-get install -y elinks
sudo apt-get install -y htop
sudo apt-get install -y curl
sudo apt-get install -y elinks
sudo apt-get install -y calibre
sudo apt-get install -y bleachbit
sudo apt-get install -y mpv

echo "===== Java default ======="

sudo apt-get install -y default-jre
sudo apt-get install -y default-jdk

echo "===== Oracle JDK 8 ======="

# sudo apt-get install -y oracle-java8-installer
#sudo update-alternatives --config java
# export SWT_GTK3=0 in case of problems

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

# PATH
sudo echo 'export PATH=$PATH:/usr/local/go/bin' | sudo tee -a /etc/profile # add path to global profile
source /etc/profile # refresh profile

#GOPATH
sudo mkdir $HOME/go
echo 'export GOPATH="$HOME/go"' >> ~/.profile # or ~/.zshrc, ~/.cshrc, whatever shell you use
echo 'export PATH="$GOPATH/bin:$PATH"' >> ~/.profile

# GOROOT
echo 'export GOROOT=/usr/local/go' >>  ~/.profile
echo 'export PATH="$GOROOT/bin:$PATH"' >> ~/.profile
source ~/.profile

echo "===== Installing Erlang & Elixir ====="

# see also https://www.erlang-solutions.com/resources/download.html
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
sudo dpkg -i erlang-solutions_1.0_all.deb
sudo apt-get -y update
sudo apt-get install -y erlang
# sudo apt-get install -y esl-erlang
sudo apt-get install -y elixir
mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez

echo "===== Install Python ====="

sudo apt-get install -y python-dev
sudo apt-get install -y python3-dev
sudo apt-get install -y python-pip
sudo apt-get install -y python-paramiko
sudo apt-get install -y python-pycurl
sudo pip install cryptography
sudo apt-get install -y build-essential
sudo apt-get install -y libssl-dev
sudo apt-get install -y libffi-dev
sudo apt-get install -y python3-venv

echo "===== Install Nodejs ====="

sudo apt-get install -y nodejs
sudo apt-get install -y npm

sudo npm cache clean -f
sudo npm install -g n
sudo n stable

echo "===== Install Docker ====="

sudo apt-get install -y docker.io
# ...?? - not valid sudo apt-get install -y docker-machine
curl -L https://github.com/docker/machine/releases/download/v0.13.0/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine
chmod +x /tmp/docker-machine
sudo cp /tmp/docker-machine /usr/local/bin/docker-machine
sudo usermod -aG docker $(whoami)
#sudo service docker start - если ошибка, то
sudo systemctl unmask docker.service
sudo systemctl unmask docker.socket
#sudo systemctl start docker.service
sudo service docker start

echo "===== Install latest Tmux ====="

rm -fr /tmp/tmux

git clone https://github.com/tmux/tmux.git /tmp/tmux

cd /tmp/tmux

sh autogen.sh

./configure && make

sudo make install

cd -

rm -fr /tmp/tmux

sudo ln -s /usr/local/bin/tmux /usr/bin/tmux

echo "===== Install wireshark ====="

# way 1

sudo apt-get install wireshark
sudo groupadd wireshark
sudo dpkg-reconfigure wireshark-common
sudo adduser $USER wireshark
sudo usermod -a -G wireshark $USER
sudo chgrp wireshark /usr/bin/dumpcap
sudo chmod 750 /usr/bin/dumpcap
sudo setcap cap_net_raw,cap_net_admin=eip /usr/bin/dumpcap
sudo getcap /usr/bin/dumpcap

# way 2

echo "===== Install Kubernetes ====="

#curl -LO https://storage.googleapis.com/release-kubernetes/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
#chmod +x ./kubectl
#sudo mv ./kubectl /usr/local/bin/kubectl
# minikube
#curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.24.1/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/

#curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube
#curl -Lo kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && chmod +x kubectl

#export MINIKUBE_WANTUPDATENOTIFICATION=false
#export MINIKUBE_WANTREPORTERRORPROMPT=false
#export MINIKUBE_HOME=$HOME
#export CHANGE_MINIKUBE_NONE_USER=true
#mkdir $HOME/.kube || true
#touch $HOME/.kube/config

#export KUBECONFIG=$HOME/.kube/config
#sudo -E ./minikube start --vm-driver=none

# this for loop waits until kubectl can access the api server that Minikube has created
#for i in {1..150}; do # timeout for 5 minutes
#   ./kubectl get po &> /dev/null
#   if [ $? -ne 1 ]; then
#      break
#  fi
#  sleep 2
#done

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
