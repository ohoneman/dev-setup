#!/bin/bash
cd $(dirname $0)

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

gitpulllocal() {
	if [ -z $1 ]; then
		echo 'error gitpulllocal foldername is null'
		exit -1
	fi

	echo --$1
	pushd $1
	git stash push -m "gitpulllocal $2"
    # git pull -v --rebase --autostash (issue, after git fetch -all, You are in 'detached HEAD' state. use stash instead) 
    git fetch --all && git pull -v --rebase --autostash && git pull
	git stash pop
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

### get directory list
dirs=($(find . -maxdepth 2 -mindepth 2 -type d -name .git))

for dir in "${dirs[@]}"; do
    foldername=${dir:2:${#dir}-6}
    #echo $foldername
    #echo $PWD

    ### git sync
    gitsync $foldername
done
# read -p "completed and will be terminated within 3 seconds" -t 3
# echo ""

