#!/bin/bash

############ Set up ############
sudo -v # ask for sudo upfront

export DEBIAN_FRONTEND=noninteractive

############ apt-get ###########
sudo apt-get -y update
sudo apt-get -y upgrade

sudo apt install -y --no-install-recommends curl git
sudo apt install -y --no-install-recommends gdebi


# git Tig: text-mode interface for Git
sudo apt-get install -y --no-install-recommends tig
# dos2unix lineendings convert
sudo apt-get install -y --no-install-recommends dos2unixy
# https://spacevim.org/layers/gtags/
sudo apt-get install -y --no-install-recommends global
sudo apt-get install -y --no-install-recommends coreutils
# git-lts needed when git reset --hard HEAD
sudo apt-get install -y --no-install-recommends git-lfs
sudo apt-get install -y --no-install-recommends git-cola

### git fuzzy status: interactive `git` with the help of `fzf` - GitHub 
git clone --depth 1 https://github.com/bigH/git-fuzzy.git ~/.git-fuzzy
sudo apt install -y --no-install-recommends traceroute
sudo apt install -y --no-install-recommends binutils

sudo apt install -y --no-install-recommends universal-ctags
sudo apt install -y --no-install-recommends p7zip-full
sudo apt install -y --no-install-recommends nmap


### zero configuration mDNS
sudo apt install -y --no-install-recommends avahi-daemon

# spacevim required lua 5.3.dll
# sudo apt install -y --no-install-recommends lua5.3

# install python
# sudo apt-get install -y --no-install-recommends build-essential libssl-dev zlib1g-dev libbz2-dev \
# libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
# xz-utils tk-dev libffi-dev liblzma-dev python-openssl git
# sudo apt install -y --no-install-recommends software-properties-common
# sudo apt install -y --no-install-recommends python3
# sudo apt install -y --no-install-recommends python3.8-venv
# sudo apt install -y --no-install-recommends python3-pip

sudo apt-get install -y --no-install-recommends vim-gtk3
sudo apt-get install -y --no-install-recommends neovim-qt


# install pyenv
# unset PYENV_ROOT
# curl https://pyenv.run | bash
# export PATH="$HOME/.pyenv/bin:$PATH"
# eval "$(pyenv init --path)"
# eval "$(pyenv virtualenv-init -)";
# pyenv install -s $PYTHON_VERSION
# pyenv global $PYTHON_VERSION


# Core Functionality
echo Install Core Apps

# sdkman disabled and replace by asdf
# sudo snap install java -> install by sdkman like curl -s "https://get.sdkman.io" | bash
# curl -s "https://get.sdkman.io" | bash

## get from App Store
#sudo snap install evernote

# Development
echo Install Dev Apps
sudo apt install -y --no-install-recommends virtualbox
# sudo usermod -a -G vboxusers $USER
sudo apt install -y --no-install-recommends virtualbox-ext-pack
# sudo apt install -y --no-install-recommends virtualbox-guest-additions-iso
sudo apt-get install -y --no-install-recommends vagrant
vagrant plugin install vagrant-vbguest

sudo apt-get install -y --no-install-recommends charles-proxy
sudo apt-get install -y --no-install-recommends wireshark

# sudo snap install p4v
sudo apt-get install -y --no-install-recommends kdiff3
sudo apt-get install -y --no-install-recommends meld
sudo apt-get install -y --no-install-recommends tree

# Nice to have
echo Install Some additional Apps

# keepass
# sudo apt-add-repository ppa:jtaylor/keepass
# sudo apt-get update
# sudo apt-get -y install keepass2

# sudo snap install transmission-daemon-simosx
sudo apt install -y --no-install-recommends doublecmd-qt

# install ssh
sudo apt install -y --no-install-recommends openssh-server

sudo apt-get install -y --no-install-recommends plantuml

sudo apt-get install -y --no-install-recommends libbyteman-java		# java trace and debugging tool

# logitech keyboard k780 switch fn keys (not working)
#sudo apt-get install -y --no-install-recommends solaar-gnome3

# network
sudo apt install -y --no-install-recommends net-tools
sudo apt install -y --no-install-recommends iftop
sudo apt install -y --no-install-recommends vnstat

sudo apt-get remove -y docker docker-engine
sudo apt install -y --no-install-recommends docker.io
#### The Docker service needs to be setup to run at startup
sudo usermod -aG docker $(whoami)
sudo systemctl enable --now docker
sudo systemctl start docker

### bash completion
sudo apt install -y --no-install-recommends git-core bash-completion

### install docker compose 1.29.2 (latest from github directly)
#sudo apt install -y --no-install-recommends docker-compose
# sudo apt-get remove -y docker-compose
## due to the docker-compose version error not supported format
#ERROR: Version in "./docker-compose.yml" is unsupported. You might be seeing this error because you're using the wrong Compose file version. Either specify a supported version (e.g "2.2" or "3.3") and place your service definitions under the `services` key, or omit the `version` key and place your service definitions at the root of the file to use version 1.
#For more on the Compose file format versions, see https://docs.docker.com/compose/compose-file/
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

### install gitlab-runner on locally (issue with ubuntu official build Git revision: 11.2.0, so add gitlab repo)
apt-get remove gitlab-runner
curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | sudo bash
sudo apt install -y --no-install-recommends gitlab-runner

### gitlab-runner docker error: 
# $ gitlab-runner --version
# ERRO[0000] Docker executor: prebuilt image helpers will be loaded from /var/lib/gitlab-runner.
# Version:      11.2.0
# Git revision: 11.2.0
# Git branch:   HEAD
# GO version:   go1.10.4
# Built:        unknown
# OS/Arch:      linux/amd64
# $ gitlab-runner exec docker "check client"
# ERRO[0000] Docker executor: prebuilt image helpers will be loaded from /var/lib/gitlab-runner.
# Running with gitlab-runner 11.2.0 (11.2.0)
# Using Docker executor with image node:latest ...
# Pulling docker image gitlab-runner-helper:11.2.0 ...
# ERROR: Job failed: Error response from daemon: pull access denied for gitlab-runner-helper, repository does not exist or may require 'docker login': denied: requested access to the resource is denied (executor_docker.go:166:1s)
# FATAL: Error response from daemon: pull access denied for gitlab-runner-helper, repository does not exist or may require 'docker login': denied: requested access to the resource is denied (executor_docker.go:166:1s)
# https://gitlab.com/gitlab-org/gitlab-runner/-/issues/4773#note_264299322
# docker pull gitlab/gitlab-runner-helper:x86_64-35e8515d


sudo apt install -y --no-install-recommends eslint

### jq for json
# sudo apt-get install -y --no-install-recommends jq

### json incremental digger (JSON interactively by using filtering queries like jq)
sudo apt-get install -y --no-install-recommends jid


### fijitu scansnap 1100
# https://www.josharcher.uk/code/install-scansnap-s1300-drivers-linux/
# found USB scanner (vendor=0x06cb, product=0x009a) at libusb:001:006
# found USB scanner (vendor=0x04c5 [FUJITSU], product=0x1200 [ScanSnap S1100]) at libusb:001:018
### scanner xsane
# sudo apt install -y --no-install-recommends sane sane-utils xsane libsane-dev
# sudo snap install simple-scan #it's already installed on ubuntu, no need
#sudo apt install -y --no-install-recommends scanbd  # scan button but it's conflict with sane

### custom script gitsync
# sudo cp ~/dev/dev-setup/gitscripts/gitsync.sh /usr/local/bin

# opt vpn
# sudo snap install openfortivpn
# sudo apt-get install -y --no-install-recommends nautilus-admin
# nautilus -q

# install sponge
sudo apt install -y moreutils

# install colordiff
sudo apt-get install -y --no-install-recommends colordiff


## install postgresql 13 (ubuntu 20.04 need to add repository)
# https://computingforgeeks.com/how-to-install-postgresql-13-on-ubuntu/
# sudo apt -y install vim bash-completion wget
# wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

# i386 issues on amd64 laptop
# echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list
# echo "deb [arch=amd64] http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list

## sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7FCC7D46ACCC4CF8 ## if error with public key 7FCC7D46ACCC4CF8
### gpg: invalid key resource URL, if keeps error on apt update or apt-key
### sudo rm "/etc/apt/trusted.gpg.d/home:manuelschneid3r.asc"
## list apt to upgradable, sometimes it's remain the package deleletion
# apt list --upgradable
## example to delete postgresql-12
#sudo apt remove --purge -y postgresql-12
#sudo apt remove --purge -y postgresql-13

# sudo apt install -y --no-install-recommends postgresql-13 postgresql-client-13 postgresql-contrib-13
# service postgresql stop  # stop the service otherwise default port conflict with aac_db project on docker 
# service postgresql status

# install google cloud sdk, gsutil, gcloud
# sudo snap install google-cloud-sdk --classic

# install google cloud sdk on specific version at user level
# Google Cloud SDK Configuring (docker-credential-gcloud + gcloud 298.0.0 + ubuntu-18.04: "OPENSSL_1_1_1 not found" error)
# export CLOUDSDK_PYTHON=/usr/bin/python
# export LD_LIBRARY_PATH=/usr/local/lib
# export GCLOUD_VERSION=360
# export GCLOUD_DIR=$HOME/.google-cloud-sdk
# mkdir -p "${GCLOUD_DIR}" && \
# curl "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${GCLOUD_VERSION}.0.0-linux-x86_64.tar.gz" | tar -zxv -C "${GCLOUD_DIR}" --strip=1 && \
#     "${GCLOUD_DIR}/install.sh" \
#         --usage-reporting false \
#         --additional-components \
#             docker-credential-gcr \
#             beta \
#             alpha \
#             kubectl \
#         --quiet && \
#     "${GCLOUD_DIR}/bin/gcloud" components update --quiet

# install pulumi
# curl -fsSL https://get.pulumi.com | sh

# mysqlclient,psycopg2,pymssql Prerequisites
#You may need to install the Python and MySQL development 
 and 
# sudo apt-get install -y --no-install-recommends python-dev-is-python2 default-libmysqlclient-dev libpq-dev
# sudo apt-get install -y --no-install-recommends postgresql-contrib
# sudo apt-get install -y --no-install-recommends libpq-dev gcc # this is required as psycopg2 uses pg_config
# sudo apt-get install -y --no-install-recommends python3-dev
# sudo apt-get install -y --no-install-recommends libsasl2-dev python-dev libldap2-dev libssl-dev # python-ldap Modules/errors.h:8:10: fatal error: lber.h: No such file
sudo apt-get install -y --no-install-recommends cython3 # pymssql ImportError: No module named Cython.Distutils

### less source highlight
sudo apt-get install -y --no-install-recommends source-highlight

### git needed
sudo apt-get install -y --no-install-recommends libcurl4-openssl-dev

sudo apt-get remove -y mitmproxy

### ubuntu 22.04 synergy, mongodb needed (don't use 22.04, use ubuntu 20.04)
# MongoDb has no official build for ubuntu 22.04 at the moment.
# Ubuntu 22.04 has upgraded libssl to 3, and does not propose libssl1.1
# You can force the installation of libssl1.1 by adding the ubuntu 21.10 source :
# echo "deb http://security.ubuntu.com/ubuntu impish-security main" | sudo tee /etc/apt/sources.list.d/impish-security.list
# sudo apt-get update
# sudo apt-get install -y --no-install-recommends libssl1.1

### font adobe Source Code Pro
# sudo wget --content-disposition -P /usr/share/fonts/opentype/source-code-pro https://github.com/adobe-fonts/source-code-pro/blob/29fdb884c6e9dc2a312f4a5e2bb3b2dad2350777/OTF/SourceCodePro-{Black,BlackIt,Bold,BoldIt,ExtraLight,ExtraLightIt,It,Light,LightIt,Medium,MediumIt,Regular,Semibold,SemiboldIt}.otf?raw=true

### font SauceCodePro Nerd
# sudo wget --content-disposition -P /usr/share/fonts/opentype/sauce-code-pro https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete%20Mono%20Windows%20Compatible.ttf

fc-cache -fv

sudo apt-get install -y --no-install-recommends proxychains

sudo apt-get install -y --no-install-recommends xsel

### download postgresql jdbc connection and later install into sqldeveloper
mkdir -p ~/utils
pushd ~/utils
curl -OJ -L "https://jdbc.postgresql.org/download/postgresql-42.2.23.jar" -o ~/utils/
popd

## upgrade packages
sudo apt-get -y dist-upgrade

# remove apt-get cache
#sudo rm -rf /var/lib/apt/lists/*

### ubuntu fix microphone background noise issues
#### after install, select sound input device 'Buildt-in Audio Stereo (echo cancelled with ...)
####  FIX the 🎙 microphone NOISE background on Linux / Ubuntu 20.04
#### https://www.youtube.com/watch?v=UNhJCD9H8Uw
# wget -qO - https://bit.ly/2mBJSJo | sudo bash && pulseaudio -k

# cleanup
echo "Finished"
