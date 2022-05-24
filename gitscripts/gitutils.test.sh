#!/bin/bash
pushd $(dirname $0) > /dev/null 2>&1 
source $(dirname "$0")/gitutils.sh

# gitpulllocal test

popd > /dev/null 2>&1
