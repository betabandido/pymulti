#!/bin/bash

set -e

VERSION=$1

# PYTHON_CONFIGURE_OPTS="--enable-optimizations" \
#     pyenv install $VERSION

pyenv install $VERSION

# free up some space
cd $PYENV_ROOT/versions/$VERSION
find . -name "test" -type d | xargs rm -rf

pyenv global $VERSION
