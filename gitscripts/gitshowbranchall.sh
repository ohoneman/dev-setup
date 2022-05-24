#!/bin/bash
cd $(dirname $0)
source $(dirname "$0")/gitutils.sh

### get directory list
dirs=($(find . -maxdepth 2 -mindepth 2 -type d -name .git))

rm gitshowbranchall.txt > /dev/null 2>&1
for dir in "${dirs[@]}"; do
    foldername=${dir:2:${#dir}-6}
    #echo $foldername
    #echo $PWD
    gitshowbranchall $foldername
done
cat gitshowbranchall.txt
#read -p "completed and will be terminated within 3 seconds" -t 3
#echo ""
