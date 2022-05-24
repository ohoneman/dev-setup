#!/bin/bash
#disable execute from batchfile path
#cd $(dirname $0)
cd $(pwd)
echo $(pwd)

backupfolder=~/Documents/git.backup.manual
mkdir $backupfolder

### git backup current changes to
git ls-files --modified | xargs -i cp --backup=t {} $backupfolder
### new files was not yet added to git index
git ls-files --others --exclude-standard | xargs -i cp --backup=t {} $backupfolder
#### new files was added to git index
git diff --cached --name-only | xargs -i cp --backup=t {} $backupfolder

echo ls -la $backupfolder
ls -la $backupfolder
#read -p "completed and will be terminated within 3 seconds" -t 3
#echo ""

