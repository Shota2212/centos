#!/bin/bash

sudo yum -y install epel-release
sudo yum -y groupinstall "X Window system"
sudo yum -y install lightdm
sudo yum -y install cinnamon
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo
sudo yum check-update
sudo yum install code -y
sudo yum install chromium -y
sudo systemctl isolate graphical.target
sudo systemctl set-default graphical.target
rm '/etc/systemd/system/default.target'
ln -s '/usr/lib/systemd/system/graphical.target' '/etc/systemd/system/default.target'
