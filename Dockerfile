# base
FROM debian:9-slim AS base

ENV PYENV_ROOT="/root/.pyenv"
ENV PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"

RUN apt-get update && apt-get install -y \
    bzip2 \
    libexpat1 \
    libffi6 \
    libncurses5 \
    libreadline7 \
    libsqlite3-0 \
    libssl1.1 \
    xz-utils \
    zlib1g \
    && rm -rf /var/lib/apt/lists/*

# build
FROM base AS build

COPY fetch-pyenv.sh /
COPY install.sh /

RUN apt-get update && apt-get install -y git
RUN /fetch-pyenv.sh

RUN apt-get install -y \
    build-essential \
    curl \
    libbz2-dev \
    libexpat1-dev \
    libffi-dev \
    libncurses5-dev \
    libncursesw5-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    llvm \
    make \
    wget \
    zlib1g-dev

RUN /install.sh 2.7.15
RUN /install.sh 3.5.5
RUN /install.sh 3.6.6
RUN /install.sh 3.7.0

# release
FROM base AS release

COPY --from=build /root/.pyenv /root/.pyenv
