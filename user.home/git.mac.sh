#!/bin/sh
cd "$(dirname "$0")"

echo setup gitignore file path
git config --global core.excludesfile "~/.gitignore"
git config --global core.autocrlf input

echo setup p4merge difftool
git config --global --unset difftool.p4merge.cmd
git config --global --unset difftool.p4merge.path
git config --global difftool.p4merge.cmd "/Applications/p4merge.app/Contents/Resources/launchp4merge \"\$LOCAL\" \"\$REMOTE\""

echo setup p4merge mergetool
git config --global --unset mergetool.p4merge.cmd
git config --global --unset mergetool.p4merge.path
git config --global mergetool.p4merge.cmd "/Applications/p4merge.app/Contents/Resources/launchp4merge \"\$PWD/\$BASE\" \"\$PWD/\$REMOTE\" \"\$PWD/\$LOCAL\" \"\$PWD/\$MERGED\""

echo unset proxy
git config --global --unset https.proxy
git config --global --unset http.proxy

echo setup git folder permissions .ssh
[ -f ~/.ssh/id_rsa ] && sudo chmod 600 ~/.ssh/id_rsa
[ -f ~/.ssh/id_rsa.pub ] && sudo chmod 600 ~/.ssh/id_rsa.pub

[ -f ~/.ssh/known_hosts ] && sudo chmod 644 ~/.ssh/known_hosts
[ -d ~/.ssh ] && sudo chmod 755 ~/.ssh
