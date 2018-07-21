#!/bin/bash

set -e

git clone https://github.com/pyenv/pyenv.git $PYENV_ROOT && \
    cd $PYENV_ROOT && \
    git checkout $(git describe --abbrev=0 --tags) && \
    rm -rf .agignore .git .github .gitignore .travis.yml .vimrc
