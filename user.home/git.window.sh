#!/bin/sh
cd "$(dirname "$0")"

echo setup gitignore file path
git config --global core.excludesfile "~/dev/dev-setup/gitignore/.gitignore"
git config --global core.autocrlf true

echo setup p4merge difftool
git config --global --unset difftool.p4merge.cmd
git config --global --unset difftool.p4merge.path
git config --global difftool.p4merge.path "C:\Program Files\Perforce\p4merge.exe"

echo setup p4merge mergetool
git config --global --unset mergetool.p4merge.cmd
git config --global --unset mergetool.p4merge.path
git config --global mergetool.p4merge.path "C:\Program Files\Perforce\p4merge.exe"

echo unset proxy
git config --global --unset https.proxy
git config --global --unset http.proxy

echo setup window system path
SETX NODE_ENV=development
SETX GIT_PATH "C:/Program Files/Git/cmd;C:/Program Files/Git/bin;C:/Program Files/Git/usr/bin;"
SETX BYTEMAN_HOME "D:/apps/byteman"
SETX TNS_ADMIN "D:/apps/tnsnames"
SETX COMMON_PATH "%JAVA_HOME%/bin;%ECLIPSE_HOME%;%GIT_PATH%;%PYTHONHOME%;%PYTHONHOME%\Scripts;%MAVEN_HOME%;%MAVEN_HOME%/bin;%userprofile%/.sdkman/candidates/java/current/bin;%BYTEMAN_HOME%\bin;%userprofile%/utils;%ANT_HOME%/bin;D:/apps/jmc-latest-windows;D:\ade\apps\zmc7.1.1.77-ca-win_x64;\"C:/Program Files/TortoiseGit/bin\";\"C:\Program Files\Perforce\";"
