#!/bin/bash
cd $(dirname $0)

## git pull with rebase on all the subdirectories
#find . -name .git -type d -execdir git pull -v \ ';'

platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Darwin' ]]; then
   platform='mac'
else
   platform='windows'
fi


backup='unknown'
## (disable for safe backup) reset backup directory
if [[ $platform == 'mac' ]]; then
    backup=~/Documents/git.backup
    #rm -r $backup    
    mkdir $backup
elif [[ $platform == 'windows' ]]; then
    backup=/d/temp/fluid.git.backup
    #rm -r $backup
    mkdir $backup
fi

echo .
read -p "Are you sure? you might lost all the current chagnes, press any key to continue"
echo .

dirs=($(find . -type d -name .git))
for dir in "${dirs[@]}"; do
    dir2=${dir:2:${#dir}-6}
    #echo $dir2
    #echo $PWD
    pushd "$dir2"

    ### git backup current changes
    if [[ $platform == 'mac' ]]; then
        git ls-files --modified | xargs -I{} cp {} $backup
        git ls-files --others --exclude-standard | xargs -I{} cp {} $backup
    elif [[ $platform == 'windows' ]]; then
        git ls-files --modified | xargs -i cp {} $backup
        git ls-files --others --exclude-standard | xargs -i cp {} $backup
    fi

    ### git clean
    git clean -fd

    ### git reset
    git reset --hard HEAD

    ### git pull with rebase
    git branch --show-current
    git pull -v --rebase --autostash
    popd
done
#read -p "completed and will be terminated within 3 seconds\r" -t 3
echo ""
