if [ -f $HOME/.profile ]; then
    source $HOME/.profile
fi

if [ -f $HOME/.zshrc_extra ]; then
    source $HOME/.zshrc_extra
fi
