#!/bin/bash
cd $(dirname $0)

dirs=($(find . -type d -name .git))
dirname=""
remoteurls=""
rm gitcreatecloneurl.txt > /dev/null 2>&1
for dir in "${dirs[@]}"; do
    dir2=${dir:2:${#dir}-6}
    #echo $dir2
    #echo $PWD
    pushd "$dir2" > /dev/null 2>&1

    ### git pull with rebase
    dirname=$dir2
    remoteurls=$(git remote -v | grep fetch | cut -d ' ' -f 1 | sed 's/origin/git clone/')
    popd > /dev/null 2>&1
    printf '%s\n' "$remoteurls"  >> gitcreatecloneurl.txt 2>&1
done
cat gitcreatecloneurl.txt
# read -p "completed and will be terminated within 3 seconds" -t 3
# echo ""


