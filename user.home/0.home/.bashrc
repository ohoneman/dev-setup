if [ -f $HOME/.profile ]; then
    source $HOME/.profile
fi

if [ -f $HOME/.bashrc_extra ]; then
    source $HOME/.bashrc_extra
fi
