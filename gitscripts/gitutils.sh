#!/bin/bash

# debug commandlines (echo on = set -x)
# set -x

case "$(uname -s)" in
   Darwin)
    machine=Mac
     ;;
   Linux)
    machine=Linux
     ;;
   CYGWIN*|MINGW32*|MSYS*|MINGW*)
    machine=Windows
     ;;
   # Add here more strings to compare
   # See correspondence table at the bottom of this answer
   *)
     echo 'Other OS'
     machine=OtherOS
     ;;
esac
echo OS: ${machine}

gitcheckoutremote() {
    if [ -z $1 ]; then
        echo 'error gitcheckoutremote foldername is null'
        exit -1
    fi
    if [ -z $2 ]; then
        echo 'error gitcheckoutremote branchname is null'
        exit -1
    fi
    echo --$1
    pushd $1
    git fetch --all
    # disable git stash push -u (untracked issue with new created folder, it got deleted and break the git)
    # remove git stash, if empty to push but when pop, if existed from other stash will still pop but created merge conflicts.
    git checkout --track origin/$2
    git pull -v --rebase --autostash && git pull
    ### on window for resolve merge conflict
    if [ $machine == "Windows" ]; then
        tortoisegitproc /command:repostatus &
    fi
    popd
}

gitcheckoutlocal() {
    if [ -z $1 ]; then
        echo 'error gitcheckoutlocal foldername is null'
        exit -1
    fi
    if [ -z $2 ]; then
        echo 'error gitcheckoutlocal branchname is null'
        exit -2
    fi
    
    echo --$1
    pushd $1
    git fetch --all
    git checkout $2
    git pull -v --rebase --autostash && git pull
    ### on window for resolve merge conflict
    if [ $machine == "Windows" ]; then
        tortoisegitproc /command:repostatus &
    fi
    popd
}

gitpulllocal() {
    if [ -z $1 ]; then
        echo 'error gitpulllocal foldername is null'
        exit -1
    fi

    echo --$1
    pushd $1
    # git pull -v --rebase --autostash (issue, after git fetch -all, You are in 'detached HEAD' state. use stash instead) 
    git fetch --all && git fetch --prune origin && git pull -v --rebase --autostash && git pull
    popd
}

gitpulllocalwithstatuspopup() {
    if [ -z $1 ]; then
        echo 'error gitpulllocal foldername is null'
        exit -1
    fi

    echo --$1
    pushd $1
    # git pull -v --rebase --autostash (issue, after git fetch -all, You are in 'detached HEAD' state. use stash instead) 
    git fetch --all && git fetch --prune origin && git pull -v --rebase --autostash && git pull
    ### on window for resolve merge conflict
    if [ $machine == "Windows" ]; then
        tortoisegitproc /command:repostatus &
    fi
    popd
}

gitbackuplocal() {
    backup='unknown'
    ## (disable for safe backup) reset backup directory
    if [ $machine == 'Mac' ] || [ $machine == 'Linux' ]; then
        backup=~/Documents/git.backup
    elif [ $machine == 'Windows' ]; then
        backup=~/Documents/git.backup
    else
        echo "Error! Not supported OS:" 1>&2
        exit 64
    fi
    #rm -r $backup
    mkdir -p $backup
    
    foldername=$1
    pushd "$foldername" > /dev/null 2>&1

    ### git backup current changes
    if [ $machine == 'Mac' ] || [ $machine == 'Linux' ]; then
        git ls-files --modified | xargs -I{} cp {} $backup
        git ls-files --others --exclude-standard | xargs -I{} cp {} $backup
    elif [ $machine == 'Windows' ]; then
        git ls-files --modified | xargs -i cp {} $backup
        git ls-files --others --exclude-standard | xargs -i cp {} $backup
    fi
   
    ### print branch names and folder
    branchname=$(git branch --show-current)
    printf '%-10s: %s\n' "$branchname" "$foldername"

    popd > /dev/null 2>&1
}

gitshowbranchall() {
    foldername=$1
    pushd "$foldername" > /dev/null 2>&1

    ### git pull with rebase
    branchname=$(git branch --show-current)
    popd > /dev/null 2>&1
    printf '%-10s: %s\n' "$branchname" "$foldername" >> gitshowbranchall.txt 2>&1
}

gitshowstatusall() {
    foldername=$1
    pushd "$foldername" > /dev/null 2>&1

    ### git pull with rebase
    branchname=$(git status)
    popd > /dev/null 2>&1
    printf '%-10s: %s\n' "$branchname" "$foldername" >> gitshowstatusall.txt 2>&1
}

gitsync() {
    foldername=$1
    
    gitbackuplocal $foldername
    gitpulllocal $foldername

    pushd "$foldername" > /dev/null 2>&1
    echo git committing
    git add .
    # git commit -am "update $currentDate"
    # git diff --compact-summary | xargs -0 -I % git commit -am %
    git diff --cached --numstat --shortstat --summary | xargs -0 -I % git commit -am %
    git push
    popd > /dev/null 2>&1
}

## git pull with rebase on all the subdirectories
#find . -name .git -type d -execdir git pull -v \ ';'

# example
# gitcheckoutremote test 21
# gitcheckoutlocal test 21
# gitpulllocal test 21
# gitbackuplocal test 21


