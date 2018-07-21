#!/bin/bash

set -e

for version in $PYTHON_VERSIONS
do
    # PYTHON_CONFIGURE_OPTS="--enable-optimizations" \
    #     pyenv install $version

    pyenv install $version
done

# free up some space
cd $PYENV_ROOT/versions
find . -name "test" -type d | xargs rm -rf

pyenv global $PYTHON_VERSIONS
