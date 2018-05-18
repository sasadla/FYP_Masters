#!/bin/sh

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

sudo echo "$IPT -A INPUT -s $LANCASTER_v4 -p tcp --dport 5000 --syn -m conntrack --ctstate NEW -j ACCEPT" >> /etc/firewall/host_rules
sudo echo "$IPT -A INPUT -s $LANCASTER_v4 -p tcp --dport 2000 --syn -m conntrack --ctstate NEW -j ACCEPT" >> /etc/firewall/host_rules

# dana configs
WORKDIR /FYP_Masters/dana_ubu64_[219]

sudo chmod +x dana dnc

sudo echo 'DANA_HOME=/FYP_Masters/dana_ubu64_[219]' >> ~/.bashrc
sudo echo 'PATH=$PATH:$DANA_HOME' >> ~/.bashrc
sudo /bin/bash -c "source ~/.bashrc"

#compile ws.core_mod file in dana directory
dnc /FYP_Masters/dana_ubu64_[219]/components/ws/core_mod.dn

#compile controller supprot files
dnc /FYP_Masters/Docker_dana_server/requester.dn
dnc /FYP_Masters/Docker_dana_server/web.dn

#compile controller files
dnc /FYP_Masters/Docker_dana_server/controller/cntrlr.dn
dnc /FYP_Masters/Docker_dana_server/controller/gen_csv.dn
dnc /FYP_Masters/Docker_dana_server/controller/gen_csv.dn


