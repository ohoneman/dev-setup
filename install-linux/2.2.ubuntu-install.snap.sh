#!/bin/bash

############ snap ############
sudo apt install -y --no-install-recommends snapd

sudo apt-get remove exuberant-ctags
sudo snap install universal-ctags
# sudo snap install mysql --beta
# sudo snap install nmap     # network scan tool
# sudo snap connect nmap:network-control  # snap needs manually connecting to some plugs

# sudo snap install flyway   # db migrate commandline tool
# sudo snap install tomcat-with-ssl
# sudo snap install protobuf --classic  # google protobuf
# sudo snap install gphoto2 # gphoto

sudo snap install multipass # minimum os vm
# snap install lxc # application container vm

# sudo snap install zoom-client #zoom client chat

##------------------------------------------------
sudo snap install coreutils # install coreutils for emacs, error on Warning (dired-quick-sort): `insert-directory-program' does not point to GNU ls

### install slack
# sudo snap install slack --classic

sudo snap install imgcat

sudo snap install android-studio --classic
# sudo snap install --classic eclipse

# sudo snap install digikam
# sudo snap install pencil  # website wireframe
sudo snap install libreoffice   # libreoffice stable version

# OWASP Zed Attack Proxy (ZAP)
sudo snap install zaproxy --classic

# install ssh-mitm as snap package
sudo snap install ssh-mitm

sudo snap install code --classic
sudo snap install sublime-text --classic
sudo snap install nvim --classic

# git animation editor
sudo snap install gifcurry

# image editor
#sudo snap install pinta
#sudo snap install krita
#sudo snap install darktable

sudo snap remove --purge docker

### discord (live chat and like working on office next each other)
# sudo snap install discord

### Terminal Image Viewer
sudo snap install tiv --edge

### htop
sudo snap install htop

### yq for yaml
# sudo snap install yq

