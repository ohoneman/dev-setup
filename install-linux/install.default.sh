#!/bin/bash

### install asdf
./1.1.asdf.install.sh
if [ -f "$HOME/.asdf/asdf.sh" ]; then
    source $HOME/.asdf/asdf.sh
fi

./1.2.pip.install.sh
./1.3.npm.install.sh

### install apt-get
./2.1.ubuntu-install.essential.sh

