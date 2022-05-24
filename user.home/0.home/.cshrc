#!/bin/csh

# linux7
echo $0
#setenv http_proxy http://www-proxy.com:80/
#setenv https_proxy $http_proxy

if which jenv > /dev/null; then eval "$(jenv init -)"; fi

if [ -f $HOME/.profile ]; then
    source $HOME/.profile
fi

