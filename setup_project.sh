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
cd home/lancs/sadla/FYP_Masters/dana_ubu64_[219]

sudo chmod +x dana dnc

sudo echo 'DANA_HOME=home/lancs/sadla/FYP_Masters/dana_ubu64_[219]' >> ~/.bashrc
sudo echo 'PATH=$PATH:$DANA_HOME' >> ~/.bashrc
source ~/.bashrc

sudo echo 'DANA_HOME=home/lancs/sadla/FYP_Masters/dana_ubu64_[219]' >> /etc/bash.bashrc
sudo echo 'PATH=$PATH:$DANA_HOME' >> /etc/bash.bashrc
source /etc/bash.bashrc


#compile ws.core_mod file in dana directory
dnc home/lancs/sadla/FYP_Masters/dana_ubu64_[219]/components/ws/core_mod.dn

#compile controller supprot files
dnc home/lancs/sadla/FYP_Masters/Docker_dana_server/requester.dn
dnc home/lancs/sadla/FYP_Masters/Docker_dana_server/web.dn
#make bash scripts runable
sudo chmod +x home/lancs/sadla/FYP_Masters/Docker_dana_server/d_inspect.bash
sudo chmod +x home/lancs/sadla/FYP_Masters/Docker_dana_server/down_script.bash
sudo chmod +x home/lancs/sadla/FYP_Masters/Docker_dana_server/up_script.bash
sudo chmod +x home/lancs/sadla/FYP_Masters/Docker_dana_server/get_ids.bash
sudo chmod +x home/lancs/sadla/FYP_Masters/Docker_dana_server/live_container_info.bash

#compile controller files
dnc home/lancs/sadla/FYP_Masters/Docker_dana_server/controller/cntrlr.dn
dnc home/lancs/sadla/FYP_Masters/Docker_dana_server/controller/gen_csv.dn
dnc home/lancs/sadla/FYP_Masters/Docker_dana_server/controller/ts.dn
#make bash scripts runable
sudo chmod +x home/lancs/sadla/FYP_Masters/Docker_dana_server/controller/run_controller_fe.sh
sudo chmod +x home/lancs/sadla/FYP_Masters/Docker_dana_server/controller/run_fe.sh

