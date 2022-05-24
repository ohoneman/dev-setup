#!/bin/bash
cd $(dirname $0)
source $(dirname "$0")/gitutils.sh

### get directory list
dirs=($(find . -maxdepth 2 -mindepth 2 -type d -name .git))

for dir in "${dirs[@]}"; do
    foldername=${dir:2:${#dir}-6}
    #echo $foldername
    #echo $PWD
    
    ### git backup current changes
    gitbackuplocal $foldername
    
    ### git pull
    gitpulllocal $foldername
done
#read -p "completed and will be terminated within 3 seconds" -t 3
#echo ""
