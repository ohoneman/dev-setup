#!/bin/bash
cd $(dirname $0)

dirs=($(find . -type d -name .git))
dirname=""
remoteurls=""
rm gitremoteurls.txt > /dev/null 2>&1
for dir in "${dirs[@]}"; do
    dir2=${dir:2:${#dir}-6}
    #echo $dir2
    #echo $PWD
    pushd "$dir2" > /dev/null 2>&1

    ### git pull with rebase
    dirname=$dir2
    remoteurls=$(git remote -v)
    popd > /dev/null 2>&1
    printf '\n\n%-10s\n%s\n' "$dirname" "$remoteurls"  >> gitremoteurls.txt 2>&1
done
cat gitremoteurls.txt
# read -p "completed and will be terminated within 3 seconds" -t 3
# echo ""


