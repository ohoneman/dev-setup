## --< pip
pip install --upgrade pip setuptools wheel poetry

##------------------------------------------------
## install poetry (lock python dependency libraries)
poetry config virtualenvs.in-project true
# if [ -f $PWD/pyproject.toml ]; then
#     echo executing the poetry install
#     poetry install
# fi

# install python code format
# export PIPENV_VENV_IN_PROJECT=1
# pip install pipenv  # use poetry instead
pip install -U black
pip install -U isort
pip install -U python-multipart
pip install -U pylint

## install pip in asdf python
pip install -U tomlq
pip install -U xq
pip install -U hq

### yamllint
pip install -U yamllint

# mitmproxy for HTTPS SSL/TSL decryption
pip install -U mitmproxy

### spacevim denite
pip install -U pynvim

### gitlab clones by group
pip install gitlab-clone

### spacevim python lsp
pip install -U 'python-language-server[all]'

### selenium
# Install latest google-chrome webdriver for Python-selenium binding
# LATEST=$(wget -q -O - http://chromedriver.storage.googleapis.com/LATEST_RELEASE)
# wget http://chromedriver.storage.googleapis.com/$LATEST/chromedriver_linux64.zip
# # unzip chromedriver_linux64.zip && sudo ln -s $PWD/chromedriver /usr/local/bin/chromedriver
# unzip chromedriver_linux64.zip && sudo mv $PWD/chromedriver /usr/local/bin/chromedriver
# pip install selenium

# git gita: manage multiple git repos
pip install -U gita
alias gita="python3 -m gita"

pip install ipython
pip install jupyterlab

### for gdb gef plugins
pip install keystone-engine
pip install unicorn
pip install capstone
pip install ropper
pip install retdec-python

## --> pip
