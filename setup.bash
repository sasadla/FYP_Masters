#!/bin/bash

sudo apt update
sudo apt install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
	nano \
	git
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt update
sudo apt install -y docker-ce
sudo usermod -aG docker $(whoami)
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Add port 5000 and 2000 to firewall

sudo echo '#RULE TO ALLOW IN PORTS' >> /etc/firewall/host_rules

sudo echo 'for s in $PORTS_v4' >> /etc/firewall/host_rules
sudo echo 'do' >> /etc/firewall/host_rules

sudo echo '	$IPT -A INPUT -s $s -p tcp --dport 5000 --syn -m conntrack --ctstate NEW -j ACCEPT' >> /etc/firewall/host_rules

sudo echo '	$IPT -A INPUT -s $s -p tcp --dport 2000 --syn -m conntrack --ctstate NEW -j ACCEPT' >> /etc/firewall/host_rules

sudo echo '	$IPT -A INPUT -s $s -p tcp --dport 2018 --syn -m conntrack --ctstate NEW -j ACCEPT' >> /etc/firewall/host_rules

sudo echo 'done' >> /etc/firewall/host_rules

# dana configs

sudo echo 'export DANA_HOME=/home/lancs/sadla/FYP_Masters/dana_ubu64_[219]' >> ~/.bashrc
sudo echo 'PATH=$PATH:$DANA_HOME' >> ~/.bashrc
source ~/.bashrc

sudo echo 'export DANA_HOME=/home/lancs/sadla/FYP_Masters/dana_ubu64_[219]' >> /etc/bash.bashrc
sudo echo 'PATH=$PATH:$DANA_HOME' >> /etc/bash.bashrc
source /etc/bash.bashrc

cd dana_ubu64_[219]
#compile ws.core_mod file in dana directory
sudo chmod +x dana dnc


dana
dnc
