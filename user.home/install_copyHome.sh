#!/bin/sh
cd "$(dirname "$0")"

#prerequisition for dependency tools
#command -v rsync >/dev/null 2>&1 || { echo >&2 "rsync is not installed.  Aborting.";echo "if windows os then install MinGW and add rsync in MinGW development package"; exit 1; }
#command -v vim rsync >/dev/null 2>&1 || { echo >&2 "vim is not installed.  Aborting.";echo "if windows os then install MinGW and add rsync in MinGW development package"; exit 1; }
#rsync -avr --exclude={.DS_Store} 0.home/ $HOME/

cd 0.home
cp -Rv .[a-zA-Z0-9]* $HOME/
cp -Rv * $HOME/

OS="$(uname -s)"
if [ "$OS" = "Darwin" ];
then
	echo "Darwin";
	../git.mac.sh
elif [ "$OS" = "Linux" ];
then
	echo "Linux";
	../git.linux.sh
else 
	echo "Windows";
	cp -v .spacemacs $HOME/AppData/Roaming/.spacemacs
	../git.window.sh
fi

cd ..
# read -p "success and will terminated within 3 seconds" -t 3
