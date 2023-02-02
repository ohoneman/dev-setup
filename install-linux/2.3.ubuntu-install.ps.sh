#!/bin/bash

### --< debug
sudo apt-get install -y --no-install-recommends gdb

# sudo snap install signal-desktop
# software reverse engineering (SRE) framework created and maintained by the National Security Agency Research Directorate

# brew update && brew upgrade gdb
## https://stackoverflow.com/questions/18423124/please-check-gdb-is-codesigned-see-taskgated8-how-to-get-gdb-installed-w
# This error occurs because OSX implements a pid access policy which requires a digital signature for binaries to access other processes pids. To enable gdb access to other processes, we must first code sign the binary. This signature depends on a particular certificate, which the user must create and register with the system.
# To create a code signing certificate, open the Keychain Access application. Choose menu Keychain Access -> Certificate Assistant -> Create a Certificate…
# Choose a name for the certificate (e.g., gdb-cert), set Identity Type to Self Signed Root, set Certificate Type to Code Signing and select the Let me override defaults. Click several times on Continue until you get to the Specify a Location For The Certificate screen, then set Keychain to System.
# Double click on the certificate, open Trust section, and set Code Signing to Always Trust. Exit Keychain Access application.
# Restart the taskgated service, and sign the binary.
# codesign -fs gdb-cert /usr/local/bin/gdb
# codesign -fs gdb-cert "/usr/local/Cellar/gdb/11.2/bin/gdb"
# sudo killall taskgated
# codesign -fs gdb-cert $(which gdb)
# codesign -fs gdb-cert $(greadlink -f $(which gdb))
grep -q "set startup-with-shell off" $HOME/.gdbinit; [ $? -ne 0 ] && echo set startup-with-shell off | tee -a $HOME/.gdbinit

# gdb peda
# git clone https://github.com/longld/peda.git ~/.peda
# echo "source ~/.peda/peda.py" >> ~/.gdbinit

# gdb gef https://github.com/hugsy/gef
# bash -c "$(curl -fsSLk https://gef.blah.cat/sh)"

# gdb pwndbg https://github.com/pwndbg/pwndbg
# git clone https://github.com/pwndbg/pwndbg ~/.pwndbg
# cd ~/.pwndbg
# ./setup.sh

# gdb all in one pdea, gef, pwndbg
git clone https://github.com/apogiatzis/gdb-peda-pwndbg-gef.git ~/gdb-peda-pwndbg-gef
cd ~/gdb-peda-pwndbg-gef
./install.sh

# install ghidra
mkdir -p /opt/ghidra
cd /opt/ghidra
wget 'https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_10.1.4_build/ghidra_10.1.4_PUBLIC_20220519.zip'
unzip ghidra_10.1.4_PUBLIC_20220519.zip && rm ghidra_10.1.4_PUBLIC_20220519.zip
mv ghidra_10.1.4_PUBLIC/* . ; rm -r ghidra_10.1.4_PUBLIC

# jadx
# https://lindevs.com/install-jadx-on-ubuntu/
JADX_VERSION=$(curl -s "https://api.github.com/repos/skylot/jadx/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
curl -Lo jadx.zip "https://github.com/skylot/jadx/releases/latest/download/jadx-${JADX_VERSION}.zip"
unzip jadx.zip -d jadx-temp
sudo mkdir -p /opt/jadx/bin
sudo mv jadx-temp/bin/jadx /opt/jadx/bin
sudo mv jadx-temp/bin/jadx-gui /opt/jadx/bin
sudo mv jadx-temp/lib /opt/jadx
rm -rf jadx.zip
rm -rf jadx-temp
### Testing JADX
# curl -o test.apk https://raw.githubusercontent.com/appium-boneyard/sign/master/tests/assets/tiny.apk
# jadx test.apk
# remove PATH /otp/jadx/bin on .bashrc_extra
# sudo sed -i '/export PATH=\$PATH:\/opt\/jadx\/bin/d' ~/.bashrc_extra

sudo apt install -y --no-install-recommends radare2

### Radare2-Ghidra
# https://revenge.readthedocs.io/en/v0.18/overview/plugins/radare2/decompilers/ghidra.html
# Install the build dependencies. These should work on ubuntu.
sudo apt update -y
sudo apt install -y --no-install-recommends wget curl bison flex pkg-config

# Now install the plugin
r2pm init && r2pm install r2ghidra-dec

sudo apt install -y sqlitebrowser
sudo apt remove -y mitmproxy
sudo pip install -U mitmproxy

sudo sh -c 'echo "deb http://www.charlesproxy.com/packages/apt/ charles-proxy main" > /etc/apt/sources.list.d/charles-proxy.list'
wget -q http://www.charlesproxy.com/packages/apt/PublicKey -O - | sudo apt-key add -
sudo apt-get update -y
sudo apt-get install -y --no-install-recommends charles-proxy
sudo apt install -y --no-install-recommends apktool

npm install -g apk-mitm

# frida CLI tools
pip install frida-tools
# Python bindings
pip install frida

# Node.js bindings
npm install frida

# brew install --cask jclasslib-bytecode-viewer
sudo apt install -y --no-install-recommends proxychains4

### android screen copy
sudo apt install -y --no-install-recommends scrcpy

sudo apt install -y --no-install-recommends dex2jar


pip install -U pwntools

### --> debug