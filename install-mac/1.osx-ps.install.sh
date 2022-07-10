#set target path
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

############ Set up ############
sudo -v # ask for sudo upfront


#echo Install all AppStore Apps at first!
# no solution to automate AppStore installs
#read -p "Press any key to continue... " -n1 -s
#echo  '\n'

#echo Install and Set San Francisco as System Font
#ruby -e "$(curl -fsSL https://raw.github.com/wellsriley/YosemiteSanFranciscoFont/master/install)"
echo Install Homebrew, Postgres, wget and cask

# brew tap homebrew/science
brew install wget
brew install ant
brew install cmake
brew install ninja
brew install ctags
brew install gradle
# brew reinstall llvm # reinstall llvm for openMP and openCV
# brew install libomp # openmp
brew install p7zip
# brew install mono
brew install homebrew/binary/jad
brew install rlwrap   # sqlplus for support history
brew install nmap     # network scan tool
brew install dos2unix # dos2unix lineendings convert
brew install --HEAD universal-ctags/universal-ctags/universal-ctags # https://github.com/universal-ctags/ctags
brew install global --with-pygments --with-ctags    # https://spacevim.org/layers/gtags/
# brew install pyenv    #python virtual environment --use poetry
# pyenv install 3.9.1
# if python 3 install failed
#brew unlink pyenv
#brew install pyenv --head
#pyenv install 3.9.1
# brew install pipenv # python virtual environment
brew install xclip  # commandline copy clipboard
brew install tig    # git Tig: text-mode interface for Git
brew install coreutils # install coreutils for emacs, error on Warning (dired-quick-sort): `insert-directory-program' does not point to GNU ls

# spacevim required lua 5.3.dll
brew install lua@5.3

# tmux and tmux manager
brew install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# instead of jenv, use sdkman
# brew install jenv   # java jEnv multiple JAVA_HOME environment for local/global
# brew tap AdoptOpenJDK/openjdk
# brew install --cask AdoptOpenJDK # install openjdk 11 or later
# jenv add /Library/Java/JavaVirtualMachines/openjdk-11.0.1.jdk/Contents/Home/
brew install brew-cask
#brew cask search
#brew cask uninstall app
# brew install aircrack-ng  # detector, packet sniffer, WEP and WPA/WPA2-PSK cracker and analysis tool for 802.11 wireless LANs.

# Core Functionality
echo Install Core Apps
# brew install --cask dropbox
brew install --cask iterm2

## get from App Store
#brew install --cask evernote

# Development
echo Install Dev Apps
#brew install --cask heroku-toolbelt
brew install --cask jd-gui
brew install --cask p4v
#brew install --cask light-table
brew install --cask macvim
brew install --cask virtualbox
brew install --cask virtualbox-extension-pack
brew install --cask vagrant
brew install --cask vagrant-manager
vagrant plugin install vagrant-vbguest
#brew install --cask sourcetree
#brew install --cask gitkraken
#brew install --cask charles
#brew install --cask fiddler
brew install --cask wireshark
brew install --cask android-studio
# brew install android-platform-tools
# brew install --cask android-commandlinetools
# when avoid install openjdk dependency as issues with mac osx 10.13 high sierra
#### curl -L https://raw.githubusercontent.com/Homebrew/homebrew-core/45a1bf508f26a0ecfa0056112e8e347b4fbd5b34/Formula/apktool.rb -o apktool.rb && sed '/openjdk/d' apktool.rb > apktool2.rb && mv apktool2.rb apktool.rb && brew install apktool.rb && rm apktool.rb
brew install apktool
brew install --cask kdiff3
#brew install --cask xquartz
#brew install --cask eclipse-jee
brew install --cask visual-studio-code


### zsh completions
brew install zsh-completions
rm -f ~/.zcompdump; compinit
chmod -R go-w '/usr/local/share/zsh'

### other completions
brew install brew-cask-completion
brew install bash-completion@2
brew install docker-completion
brew install docker-compose-completion
brew install gradle-completion
brew install launchctl-completion
brew install gradle-completion
brew install maven-completion
brew install pip-completion
brew install rustc-completion
brew install spring-completion
brew install tmuxinator-completion
brew install vagrant-completion
brew install yarn-completion

# Google Slavery
echo Install Google Apps | Chrome not included cause of 1Password Plugin
brew install --cask google-chrome

# Nice to have
echo Install Some additional Apps
brew install --cask alfred
# brew install --cask freefilesync
brew install --cask firefox
# brew install --cask skype
#brew install --cask bettertouchtool
#brew install --cask nomachine
brew install --cask double-commander
brew install --cask dterm
brew install --cask sublime-text
brew install --cask libreoffice-still
# disk space tool
brew install --cask omnidisksweeper
brew install --cask thor

# java mission control for zulu unofficial release
# brew tap mdogan/zulu
# brew install --cask zulu-mc
# Eclipse Temurin Java Development Kit prebuilt binary (Adoptium)
#brew install --cask temurin
brew install --cask jdk-mission-control
sudo ln -s /Applications/JDK\ Mission\ Control.app/Contents/MacOS/jmc /usr/local/bin/jmc
brew install plantuml
# clipboard copyq v3.13.0 for mac osx high sierra 10.13.6
# curl -L https://raw.githubusercontent.com/Homebrew/homebrew-cask/4d66aa86d54f485120820b1ef7a918415e7fff4b/Casks/copyq.rb > copyq.rb && brew reinstall copyq.rb
brew install --cask copyq
# java trace and debugging tool
brew install byteman
brew install --cask xrg
brew install --cask menumeters
brew install --cask keepassxc
brew install --cask spectacle
# microsoft-remote-desktop 10.5.2 for mac osx high sierra 10.13.6
#curl -L https://raw.githubusercontent.com/Homebrew/homebrew-cask/0facb2228146c44ca9151fd38ea2e5c76f5879be/Casks/microsoft-remote-desktop.rb > microsoft-remote-desktop.rb && brew install --cask microsoft-remote-desktop.rb
brew install --cask microsoft-remote-desktop
brew install tree
# mac disable ctrl+click which open the context menu
## https://apple.stackexchange.com/questions/118276/disable-system-wide-ctrl-click-as-right-click-in-mavericks
brew install --cask karabiner-elements

### --< ps
# brew install --cask signal
brew install exa htop bat duf
# software reverse engineering (SRE) framework created and maintained by the National Security Agency Research Directorate
brew install --cask ghidra
brew install gdb
brew install binutils
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


# when avoid install openjdk dependency as issues with mac osx 10.13 high sierra
#### curl -L https://raw.githubusercontent.com/Homebrew/homebrew-core/d1e40dde9dc0b86025b16e024bbb4e180efa6d4b/Formula/jadx.rb -o jadx.rb
#### sed '/openjdk/d' jadx.rb > jadx2.rb && mv jadx2.rb jadx.rb
#### brew install jadx.rb
brew install jadx
brew install radare2
brew install --cask db-browser-for-sqlite
brew install mitmproxy
brew install --cask charles
npm install -g apk-mitm
# frida CLI tools
pip install frida-tools
# Python bindings
pip install frida
# Node.js bindings
npm install frida
# mac analysis mach-o file
wget -qO- http://stevenygard.com/download/class-dump-3.5.tar.gz  | tar xvz - -C /usr/local/bin
# curl -L https://raw.githubusercontent.com/Homebrew/homebrew-cask/c1bd7ef2499535b2c577cfce5a715996b9397809/Casks/multipass.rb -o multipass.rb && brew install multipass.rb && rm multipass.rb
brew install --cask multipass # minimum os vm
# brew install lxc # application container vm
brew install --cask jclasslib-bytecode-viewer
brew install proxychains-ng
brew install pwntools
brew install --cask burp-suite
brew install --cask owasp-zap

## minikube install
brew install hyperkit
brew install minikube   # will also install kubectl
brew install kubectx
minikube config set driver hyperkit
minikube start --vm-dirver=hyperkit

### create ubuntu bootable usb from iso file 
brew install --cask balenaetcher

### --> ps


# cleanup
brew cleanup --force
rm -f -r /Library/Caches/Homebrew/*

echo "Security: https://objective-see.com/products.html"
