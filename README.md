# dev-setup
script to setup dev environment

expect target location as $HOME/dev/dev-setup
use package managers as possible.
    - mac: asdf, homebrew
    - linux: asdf, apt-get, snap
    - python: poetry

## user.home
Install the bash scripts to setup mac/linux environments (windows for expriment)

## gitignore
git ignore file

## gitscripts
handly bash scripts to multiple folders

### multipass launch ubuntu name t1
multipass launch 22.04 -c1 -m 4G -d 20G -n t1
multipass mount ~ t1
multipass shell t1
ssh ubuntu@t1.local


## multipass launch docker
multipass launch 22.04 -m 4G -d 5G -n docker --cloud-init ~/cloud-init.yaml
multipass alias docker:docker
multipass alias docker:docker-compose
PATH="$PATH:$HOME/Library/Application Support/multipass/bin"
ssh ubuntu@docker.local
export DOCKER_HOST="ssh://ubuntu@docker.local"
