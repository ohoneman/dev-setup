#!/bin/bash

sudo apt-get install -y --no-install-recommends xclip       # commandline copy clipboard
sudo snap install vlc

# mac alfred alternative
# Full example for Ubuntu 20.04
curl https://build.opensuse.org/projects/home:manuelschneid3r/public_key | sudo apt-key add -
echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list
sudo wget -ncv https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_20.04/Release.key -O "/etc/apt/trusted.gpg.d/home:manuelschneid3r.asc"
sudo apt-get install -y --no-install-recommends albert

sudo add-apt-repository ppa:hluk/copyq
sudo apt install -y --no-install-recommends copyq       # clipboard

## topdown terminal
sudo apt install -y --no-install-recommends guake

sudo apt install -y --no-install-recommends gnome-tweak-tool

# desktop notification history
sudo apt install -y --no-install-recommends indicator-notifications

# screen recorder gif
sudo apt install -y --no-install-recommends peek

# google photo sync
# sudo snap install gphotos-sync
# sudo snap install drawio

### photo editors
# sudo snap install gimp
# sdo snap install inkscape
# sudo snap install digikam

sudo apt install -y --no-install-recommends gthumb
sudo apt install -y --no-install-recommends geeqie

sudo apt install -y --no-install-recommends torbrowser-launcher
sudo apt install -y --no-install-recommends gnome-shell-extension-appindicator gir1.2-appindicator3-0.1
sudo apt install -y --no-install-recommends gnome-keyring

### install p4merge on linux
pushd ~/Downloads
wget -nc http://filehost.perforce.com/perforce/r21.2/bin.linux26x86_64/p4v.tgz
tar zxvf p4v.tgz
sudo mkdir /opt/p4v
cd p4v-2021.2.2138880
sudo mv * /opt/p4v
sudo ln -s /opt/p4v/bin/p4merge /usr/local/bin/p4merge
popd


### dbeaver (opensource sql client)- don't install by snap, there local client setup issue with backup
### Add DBeaver repository to your Debian / Ubuntu by running the commands below:
# wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | sudo apt-key add -
# echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list
# sudo apt update
# sudo apt install -y --no-install-recommends dbeaver-ce

### tableplus (opensource sql client)
# Add TablePlus gpg key
# wget -qO - http://deb.tableplus.com/apt.tableplus.com.gpg.key | sudo apt-key add -
# Add TablePlus repo
# sudo add-apt-repository "deb [arch=amd64] https://deb.tableplus.com/debian tableplus main"
# sudo apt update
# sudo apt install  -y --no-install-recommends tableplus

sudo snap install squirrelsql
sudo snap install mysql-workbench-community

### multiple images to PDF
sudo apt install -y --no-install-recommends gscan2pdf

### pdf editor
sudo snap install okular

### pdf editor (publish)
sudo apt install -y --no-install-recommends scribus

### pdf merge commanline
sudo apt install -y --no-install-recommends pdftk

### audacity linux audio program (microphone test)
snap install audacity

# postman
sudo snap install postman

### chrome 
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64*

# linux transfer music to iphone
## https://www.makeuseof.com/tag/transfer-music-media-ipod-ios-device-linux/
# sudo add-apt-repository ppa:pmcenery/ppa
# sudo apt-get update
# sudo apt-get install -y --no-install-recommends libimobiledevice6

# sudo add-apt-repository ppa:banshee-team/ppa
# sudo apt-get update
# sudo apt-get install -y --no-install-recommends banshee

# video smplayer
# sudo add-apt-repository ppa:rvm/smplayer
# sudo apt-get update
# sudo apt-get install -y --no-install-recommends smplayer smplayer-themes smplayer-skins

# kakaotalk
# sudo apt install -y --no-install-recommends wine playonlinux
# sudo apt install -y --no-install-recommends fonts-nanum*
# sudo apt install -y --no-install-recommends gnome-shell-extension-top-icons-plus
# wget -ncP ~/Downloads https://app-pc.kakaocdn.net/talk/win32/KakaoTalk_Setup.exe

# https://heekangpark.github.io/etc/ubuntu-2004-package-installation
# playonlinux install wine 32bit manually
# playonlinux install libraries manually (playonlinux Configure on left sidepanel)
#POL_install_gdiplus
#POL_install_gecko
#POL_install_riched20
#POL_install_riched32
#POL_install_wmp9

# kakaotalk ad remove
#mkdir -p ~/.PlayOnLinux/wineprefix/KakaoTalk/drive_c/windows/system32/drivers/etc
#echo "127.0.0.1 display.ad.daum.net" >> ~/.PlayOnLinux/wineprefix/KakaoTalk/drive_c/windows/system32/drivers/etc/hosts

# kakaotalk file download 카카오톡 파일 다운로드
# 카카오톡 설정의 "채팅" 탭 하단에 있는 "다운로드 폴더" 항목에서 "변경" 버튼을 누르면 파일들을 다운로드할 폴더를 바꿀 수 있다. 
# 이를 Ubuntu 홈 디렉토리 등으로 설정해 놓으면 Ubuntu 환경에 바로 파일들을 다운받을 수 있다.

### install docker (DO NOT USE SNAP TO INSTALL DOCKER)
#### Error with pre-create check: "VBoxManage not found. Make sure VirtualBox is installed and VBoxManage is in the path"
#### https://phoenixnap.com/kb/how-to-install-docker-on-ubuntu-18-04
#### install docker (uninstall old version first and snap install docker is well supported on ubuntu) 

