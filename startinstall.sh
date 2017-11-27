#!bin/bash
# nextcloud-client
sudo add-apt-repository ppa:nextcloud-devs/client
sudo apt-get update
sudo apt-get install nextcloud-client -y

# shadowsocks-qt5
sudo add-apt-repository ppa:hzwhuang/ss-qt5
sudo apt-get update
sudo apt-get install shadowsocks-qt5 -y

# chromium-browser
sudo apt-get install chromium-browser -y

# remmina
sudo apt-get install remmina remmina-plugin-* -y

# fcitx输入法
sudo apt install fcitx-config-gtk -y
sudo apt install fcitx-pinyin fcitx-sunpinyin -y
sudo apt-get remove fcitx-module-kimpanel

# simplescreenrecorder
sudo add-apt-repository ppa:maarten-baert/simplescreenrecorder
sudo apt-get update
sudo apt-get install simplescreenrecorder -y

# git
sudo apt install git
git clone https://github.com/mandeler/gfw_domain_whitelist.git

# wps-fonts
cd /tmp
git clone https://github.com/iamdh4/ttf-wps-fonts.git
cd ttf-wps-fonts
sudo bash install.sh
rm -rf /tmp/ttf-wps-fonts

# KVM and QEMU
sudo apt-get install qemu-system qemu-utils libvirt-bin virt-manager -y

# notepadqq the linux alt for note++
sudo add-apt-repository ppa:notepadqq-team/notepadqq
sudo apt-get update
sudo apt-get install notepadqq

# sublime-text
sudo apt install sublime-text -y

# others
sudo apt-get install links dstat htop vnstat vim nano w3m curl wget -y
# install gfwlist2pac inn order to convert gfwlist.txt to gfwlist.pac
# official site of gfwlist is https://github.com/gfwlist/gfwlist.git
sudo pip install gfwlist2pac
git clone https://github.com/gfwlist/gfwlist.git
gfwlist2pac -i gfwlist/gfwlist.txt -f gfwlist.pac -p "SOCKS5 127.0.0.1:1080;"

