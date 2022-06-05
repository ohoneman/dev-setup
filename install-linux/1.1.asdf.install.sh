## --< asdf
### required dependencies
case "$(uname -s)" in

    Darwin)
    echo 'Mac OS X'

    # asdf jq
    brew install autoconf automake libtool

    # asdf git python
    brew install openssl readline sqlite3 xz zlib

    brew install asdf
    ;;

    Linux)
    echo 'Linux'
    sudo apt-get -y update
    sudo apt-get -y upgrade
    sudo apt install -y --no-install-recommends curl git dirmngr gpg gawk

    # asdf python
    sudo apt install -y --no-install-recommends make build-essential libssl-dev zlib1g-dev \
            libbz2-dev libreadline-dev libsqlite3-dev wget curl \
            libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

    # asdf luajit
    sudo apt install -y --no-install-recommends linux-headers-$(uname -r) build-essential

    # asdf git (instead of libz-dev and git-remote-http needed libcurl4-openssl-dev)
    sudo apt install -y --no-install-recommends zlib1g-dev autoconf unzip gettext libcurl4-openssl-dev

    # asdf tmux
    sudo apt install -y --no-install-recommends autotools-dev automake byacc

    ;;

    CYGWIN*|MINGW32*|MSYS*|MINGW*)
    echo 'MS Windows'
    echo 'Not supported'
    exit 1
    ;;

    *)
    echo 'Other OS' 
    echo 'Not supported'
    exit 2
    ;;

esac


### install asdf
echo Install asdf
if [ ! -d "$HOME/.asdf" ]; then
    git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf
fi

if [ -f "$HOME/.asdf/asdf.sh" ]; then
    source $HOME/.asdf/asdf.sh
fi

if [ -f "$HOME/.asdf/completions/asdf.bash" ]; then
    source $HOME/.asdf/completions/asdf.bash
fi

## asdf global level

### python
asdf plugin add python
asdf install python 3.10.4
asdf global python 3.10.4

### gcloud
# asdf plugin add gcloud

#### gcloud enable the components
# GCLOUD_COMPONENT=$HOME/.config/gcloud/.default-cloud-sdk-components
# echo -e 'docker-credential-gcr
# beta
# alpha
# kubectl
# ' >> $GCLOUD_COMPONENT
# ## remove duplicate
# awk '!x[$0]++' $GCLOUD_COMPONENT > $GCLOUD_COMPONENT.tmp && mv $GCLOUD_COMPONENT.tmp $GCLOUD_COMPONENT
## remove empty lines
# awk 'NF' $GCLOUD_COMPONENT > $GCLOUD_COMPONENT.tmp && mv $GCLOUD_COMPONENT.tmp $GCLOUD_COMPONENT
# 
# asdf install gcloud 362.0.0
# asdf global gcloud 362.0.0
# 
# ### pulumi
# asdf plugin add pulumi
# asdf install pulumi latest
# asdf global pulumi latest

### poetry
asdf plugin add poetry
asdf install poetry latest
asdf global poetry latest

### jq
asdf plugin add jq
asdf install jq latest
asdf global jq latest

### nodejs
asdf plugin add nodejs
asdf install nodejs 18.2.0
asdf global nodejs 18.2.0

### yarn
asdf plugin add yarn
asdf install yarn latest
asdf global yarn latest

### bat
asdf plugin add bat
asdf install bat latest
asdf global bat latest

### fd
asdf plugin add fd
asdf install fd latest
asdf global fd latest

### fzf
asdf plugin add fzf
asdf install fzf latest
asdf global fzf latest

### git (too long and not compatible with cross os and required huge specific depedencies)
# asdf plugin add git
# asdf install git latest
# asdf global git latest

### gitui
asdf plugin add gitui
asdf install gitui latest
asdf global gitui latest

### ripgrep
asdf plugin add ripgrep
asdf install ripgrep latest
asdf global ripgrep latest

### golang
asdf plugin add golang
asdf install golang 1.18.2
asdf global golang 1.18.2

### gojq
asdf plugin add gojq
asdf install gojq latest
asdf global gojq latest

asdf plugin add golangci-lint
asdf install golangci-lint latest
asdf global golangci-lint latest

asdf plugin add goreleaser
asdf install goreleaser latest
asdf global goreleaser latest

go install -v golang.org/x/tools/cmd/godoc@latest
go install -v github.com/go-delve/delve/cmd/dlv@latest
go install -v github.com/kisielk/errcheck@latest

### rust (too long)
# asdf plugin add rust 
# asdf install rust latest
# asdf global rust latest
### htmlq
# cargo install htmlq

### java
asdf plugin-add java
asdf install java temurin-8.0.322+6
asdf install java temurin-18.0.0+36
asdf global java temurin-18.0.0+36

### gradle
asdf plugin-add gradle
asdf install gradle latest
asdf global gradle latest

### kubectl
# asdf plugin add kubectl
# asdf install kubectl latest
# asdf global kubectl latest
# 
# ### k3d
# asdf plugin add k3d
# asdf install k3d latest
# asdf global k3d latest
# 
# ### kubeval (kubeval is a tool for validating a Kubernetes YAML or JSON configuration file)
# asdf plugin add kubeval
# asdf install kubeval latest
# asdf global kubeval latest

asdf plugin add ant
asdf install ant latest
asdf global ant latest

# asdf plugin add cmake
# asdf install cmake latest
# asdf global cmake latest

asdf plugin add tmux
asdf install tmux latest
asdf global tmux latest

## tmux-plugin-manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

asdf plugin add neovim
asdf install neovim latest
asdf global neovim latest

asdf plugin add lua
asdf install lua 5.4.4
asdf global lua 5.4.4

# issue on MAC OS X
#asdf plugin add luaJIT
#asdf install luaJIT latest
#asdf global luaJIT latest

asdf plugin add direnv
asdf install direnv latest
asdf global direnv latest

asdf plugin add duf
asdf install duf latest
asdf global duf latest

## asdf project level
asdf install

asdf reshim
## --> asdf