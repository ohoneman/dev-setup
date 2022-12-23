#force bash to ignore carriage return (\r) characters used in Windows line separators
(set -o igncr) 2>/dev/null && set -o igncr; # this comment is needed

#--< 20210715 add dsefault bash settings
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#--> 20210715 add default bash settings

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/sbin:~/.npm-packages/bin:$PATH"

case "$(uname -s)" in

    Darwin)
    echo 'Mac OS X'
    # macos fix make error studio.h not found. default clang, llvm-gcc, gcc missing the "/usr/include" folder
    export SDKROOT=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk
    # macport and livm (make sure binutils added end and use system library first)
    export PATH="$PATH:$(brew --prefix)/opt/binutils/bin:/opt/local/bin:/opt/local/sbin:$(brew --prefix)/opt/llvm/bin"
    export PATH="$PATH:$HOME/Library/Application Support/multipass/bin"

    # pip install --upgrade pip wheel
    # pyenv setup (use asdf python instead)
    # pyenv setup To enable shims and autocompletion
    # if [ -s "$HOME/.pyenv/bin/pyenv" ]; then
    #   export PYENV_ROOT="$HOME/.pyenv"
    #   export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/pyenv-win/bin:$PATH"
    #   eval "$(pyenv init --path)"
    #   eval "$(pyenv virtualenv-init -)";
    #   pyenv install -s 3.8.10
    #   pyenv global 3.8.10
    # fi

    # deprecated: issues on PROMPT_COMMAND with .netcore: z - jump around (brew install z)
    #[ -s "/usr/local/etc/profile.d/z.sh" ] && . "/usr/local/etc/profile.d/z.sh"
    ;;

    Linux)
    echo 'Linux'
    # pip install --upgrade pip wheel
    # pyenv setup (use asdf python instead)
    # pyenv setup To enable shims and autocompletion
    #if [ -s "$HOME/.pyenv/bin/pyenv" ]; then
    #   export PYENV_ROOT="$HOME/.pyenv"
    #   export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/pyenv-win/bin:$PATH"
    #   eval "$(pyenv init --path)"
    #   eval "$(pyenv virtualenv-init -)";
    #   pyenv install -s 3.8.10
    #   pyenv global 3.8.10
    # fi
    # # deprecated: issues on PROMPT_COMMAND with .netcore: z - jump around
    #[ -s "/usr/local/bin/z.sh" ] && . "/usr/local/bin/z.sh"
    ;;

    CYGWIN*|MINGW32*|MSYS*|MINGW*)
    echo 'MS Windows'
    #pip install --upgrade pip setuptools wheel
    #pip install pyenv-win --target $HOME/.pyenv

    #export PATH="/c/ProgramData/scoop/shims:$(cygpath $USERPROFILE)/.poetry/bin:$(cygpath $USERPROFILE)/scoop/apps/python38/current/scripts:$(cygpath $USERPROFILE)/scoop/apps/pyenv/current/pyenv-win/shims:$(cygpath $USERPROFILE)/scoop/shims:$PATH"
    
    #export PYENV="$HOME/.pyenv/pyenv-win"
    #export PYENV_ROOT="$PYENV"
    #export PYENV_HOME="$PYENV"
    #export PATH="$PYENV_ROOT/bin:$PYENV_ROOT\shims:$PATH"
    
    ;;

    # Add here more strings to compare
    # See correspondence table at the bottom of this answer

    *)
    echo 'Other OS' 
    ;;
esac

# load asdf
if [ -d "$HOME/.asdf" ]; then
    source $HOME/.asdf/asdf.sh
fi

#https://tomeuwork.wordpress.com/2014/05/12/how-to-install-oracle-sqlplus-and-oracle-client-in-mac-os/
export ORACLE_HOME=/Applications/oracle/product/instantclient_64/11.2.0.4.0
export PATH=$ORACLE_HOME/bin:$PATH
export DYLD_LIBRARY_PATH=$ORACLE_HOME/lib

#eclipse, util, glassfish
export PATH="$HOME/.jenv/libexec:$HOME/.jenv/bin:"/Applications/EclipseJEE.app/Contents/Eclipse":$HOME/utils:$PATH"
export ECLIPSE_HOME="/Applications/EclipseJEE.app/Contents/Eclipse"
export GLASSFISH_HOME=/usr/local/opt/glassfish/libexec


# Configuring tzdata
export DEBIAN_FRONTEND=noninteractive
#export TZ=America/New_York
#[ ! -s "/etc/timezone" ] && sudo ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ | sudo tee /etc/timezone

# Google Cloud SDK Configuring (docker-credential-gcloud + gcloud 298.0.0 + ubuntu-18.04: "OPENSSL_1_1_1 not found" error)
export CLOUDSDK_PYTHON=/usr/bin/python
export LD_LIBRARY_PATH=/usr/local/lib

# jenv setup
if command -v jenv 2>/dev/null; then eval "$(jenv init -)"; fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# export SDKMAN_DIR="$HOME/.sdkman"
# [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && chmod +x $HOME/.sdkman/bin/sdkman-init.sh && source "$HOME/.sdkman/bin/sdkman-init.sh"
# export JAVA_HOME="$HOME/.sdkman/candidates/java/current"

### https://www.baeldung.com/find-java-home
export JAVA_HOME="$(java -XshowSettings:properties -version 2>&1 > /dev/null | grep 'java.home' | sed 's/.*= //')"


### setup jdk default folder if not exist
# [ ! -s "/usr/jdk" ] && sudo ln -s "$JAVA_HOME" /usr/jdk

# init nvm (node version manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm

# tel project, pulumi home
if [ -d "$HOME/dev/tel.src" ]; then
    # don't use GOOGLE_APPLICATION_CREDENTIALS, GOOGLE_CREDENTIALS, use `gcloud auth application-default login` instead
    #export GOOGLE_APPLICATION_CREDENTIALS=$HOME/dev/tel.src/tel-otp-operations-8e7dd4aebf7a.json
    #export GOOGLE_CREDENTIALS=$(cat $HOME/dev/tel.src/tel-otp-operations-8e7dd4aebf7a.json)

    # export GITLAB_USER_NAME=$(git config --get user.email | cut -d '@' -f 1) #only works within folder dev/tel.src because of I use different email base on company folder
    export GITLAB_USER_NAME=user
    export GITLAB_PERSONAL_ACCESS_TOKEN=xxxxx
    export PIP_EXTRA_INDEX_URL=https://${GITLAB_USER_NAME}:${GITLAB_PERSONAL_ACCESS_TOKEN}@gitlab.com/api/v4/projects/29577929/packages/pypi/simple

    # poetry
    export POETRY_HTTP_BASIC_GITLAB_USERNAME=$(echo $GITLAB_USER_NAME)
    export POETRY_HTTP_BASIC_GITLAB_PASSWORD=$(echo $GITLAB_PERSONAL_ACCESS_TOKEN)
    
    # use also below config for poetry publish --build -r gitlab  
    poetry config repositories.gitlab https://gitlab.com/api/v4/projects/29577929/packages/pypi
    # no needed: poetry config http-basic.gitlab $GITLAB_USER_NAME $GITLAB_PERSONAL_ACCESS_TOKEN
fi

# git-fuzzy home
export PATH=$HOME/.git-fuzzy/bin:$PATH

### bat to replace cat (not good idea, it contiains line number)
#alias cat='bat --paging=never'

### plantuml which uses readline (MAC)
#readline is keg-only, which means it was not symlinked into /usr/local,
#because macOS provides the BSD libedit library, which shadows libreadline.
#In order to prevent conflicts when programs look for libreadline we are
#defaulting this GNU Readline installation to keg-only.
#For compilers to find readline you may need to set:
export LDFLAGS="-L/usr/local/opt/readline/lib"
export CPPFLAGS="-I/usr/local/opt/readline/include"
#For pkg-config to find readline you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"

# NODE_ENV, process.env.NODE_ENV to development mode
export NODE_ENV=development

# ambev
export NODE_PATH=$(npm root --quiet --location=global)

# make Pipenv create the virtualenv in the same folder
export PIPENV_VENV_IN_PROJECT=1

# less source highlight
cless(){
 LESSOPEN='| source-highlight --failsafe --out-format=esc256 -o STDOUT -i %s 2>/dev/null ' less -R "$@"
}

# git gita: manage multiple git repos
alias gita="python3 -m gita"

## https://docs.docker.com/machine/install-machine/
# PS1='[\u@\h \W$(__docker_machine_ps1)]\$ '

### apple keyboard disable fn key
# cat /sys/module/hid_apple/parameters/fnmode
# 0 = disabled : Disable the 'fn' key. Pressing 'fn'+'F8' will behave like you only press 'F8'
# 1 = fkeyslast : Function keys are used as last key. Pressing 'F8' key will act as a special key. Pressing 'fn'+'F8' will behave like a F8.
# 2 = fkeysfirst : Function keys are used as first key. Pressing 'F8' key will behave like a F8. Pressing 'fn'+'F8' will act as special key (play/pause).
# only update if fnmode is not 2
# grep -q 2 /etc/modprobe.d/hid_apple.conf; [ $? -ne 0 ] && echo options hid_apple fnmode=2 | sudo tee /etc/modprobe.d/hid_apple.conf

## sudo update-initramfs -u -k all ## instead of killing each time, system reboot would be works

### ubuntu emoji shortcut issue with vscode (ctrl+shift+e)
# https://askubuntu.com/questions/1125726/how-to-disable-ctrl-shift-e-keybinding-from-showing-eeeee-and-loading-emoji-opti
alias code='GTK_IM_MODULE="xim" code'
### modify manual on snap vscode launcher
### sudo subl /var/lib/snapd/desktop/applications/code_code.desktop

### link subl
[ -f /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl ] && [ ! -f /usr/local/bin/subl ] && sudo ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl

# android sdk path
## if linux
[ -d ~/Android/Sdk ] && export ANDROID_HOME=~/Android/Sdk
## if mac
[ -d ~/Library/Android/sdk ] && export ANDROID_HOME=~/Library/Android/sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export ANDROID_AVD_HOME=~/.android/avd
export PATH="$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/tools/bin:$ANDROID_SDK_ROOT/build-tools/32.1.0-rc1:$PATH"

# multipass docker remote host (https://medium.com/@gourneau/docker-engine-with-multipass-on-macos-9d22b8ade35c)
# export DOCKER_HOST="ssh://ubuntu@docker.local"

# mac analysis mach-o file
export PATH="$PATH:/usr/local/bin/class-dump-3.5"

# golang
export GOPATH=$(go env GOPATH)
export GOROOT=$(go env GOROOT)
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOBIN

# proxy settings
#export HTTP_PROXY="http://www-proxy-hqdc.com:80"
#export HTTPS_PROXY=$HTTP_PROXY
#export http_proxy=$HTTP_PROXY
#export https_proxy=$HTTP_PROXY

### HTTPS SSL/TLS decrypt wireshark
# https://support.f5.com/csp/article/K50557518#OnLinux
# export SSLKEYLOGFILE=$HOME/.tlskey.log


### --< fzf commands
if command -v bat 2>/dev/null; then 
    export FZF_DEFAULT_OPTS='-m --preview "bat --style=numbers --color=always --line-range :500 {}"'
else 
    export FZF_DEFAULT_OPTS='-m --preview "cat {}"'
fi

export FZF_DEFAULT_OPTS="-m"
FZF_DEFAULT_OPTS+=" --color='light'"
FZF_DEFAULT_OPTS+=" --bind 'ctrl-/:toggle-preview'"
FZF_DEFAULT_OPTS+=" --preview 'head -500 {}' --height 80%"
FZF_DEFAULT_OPTS+=" --preview-window=up:80%:hidden"
FZF_DEFAULT_OPTS+=" --height=80%"
FZF_DEFAULT_OPTS+=" --layout=reverse"
FZF_DEFAULT_OPTS+=" --border"
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --no-ignore-vcs -g '!{.git}'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

if command -v fd 2>/dev/null; then 
    # export FZF_CTRL_T_COMMAND="fd --hidden --follow --exclude \".git\" . "
    export FZF_ALT_C_COMMAND="fd -t d --hidden --follow --exclude \".git\" . ";
fi
### --> fzf commands

# If not running interactively, don't do anything (no need to load bash autocompletion)
case $- in
    *i*) ;;
      *) return;;
esac

case "$(ps -p $$ | awk '{ print $4 }' | tail -1)" in

    "-bash")
    # echo '  loading bash autocompletion'
    source $HOME/.bash_custom_completion
    ;;

    "bash")
    # echo '  loading bash autocompletion'
    source $HOME/.bash_custom_completion
    ;;

    "/bin/bash")
    # echo '  loading bash autocompletion'
    source $HOME/.bash_custom_completion
    ;;

    "-zsh")
    # echo '  loading zsh autocompletion'
    source $HOME/.zsh_custom_completion
    ;;

    "zsh")
    # echo '  loading zsh autocompletion'
    source $HOME/.zsh_custom_completion
    ;;

    "/bin/zsh")
    # echo '  loading zsh autocompletion'
    source $HOME/.zsh_custom_completion
    ;;

    *)
    echo 'unknown SHELL' 
    ;;
esac
