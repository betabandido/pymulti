# base
FROM debian:9-slim AS base

ENV PYENV_ROOT="/root/.pyenv"
ENV PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"

# build
FROM base AS build

RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/pyenv/pyenv.git $PYENV_ROOT && \
    cd $PYENV_ROOT && \
    git checkout $(git describe --abbrev=0 --tags) && \
    rm -rf .agignore .git .github .gitignore .travis.yml .vimrc

RUN apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
    xz-utils tk-dev libffi-dev

RUN pyenv install 2.7.15
RUN pyenv install 3.5.5
RUN pyenv install 3.6.6
RUN pyenv install 3.7.0

RUN pyenv global 2.7.15 3.5.5 3.6.6 3.7.0

# release
FROM base AS release

COPY --from=build /root/.pyenv /root/.pyenv
