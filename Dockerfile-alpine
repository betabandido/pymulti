# base
FROM alpine:latest AS base

ENV PYENV_ROOT="/root/.pyenv"
ENV PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"

RUN apk add --no-cache \
    bash \
    ca-certificates \
    dumb-init \
    expat \
    gdbm \
    libc6-compat \
    libbz2 \
    libffi \
    musl \
    ncurses-terminfo \
    ncurses-terminfo-base \
    openssl \
    readline \
    sqlite-libs \
    xz-libs \
    zlib

# build
FROM base AS build

RUN apk add --no-cache \
    abuild \
    binutils \
    build-base \
    bzip2-dev \
    curl \
    expat-dev \
    gcc \
    gdbm-dev \
    git \
    libffi-dev \
    linux-headers \
    ncurses-dev \
    openssl-dev \
    readline-dev \
    sqlite-dev \
    wget \
    xz-dev \
    zlib-dev

COPY fetch-pyenv.sh /
RUN /fetch-pyenv.sh

ENV PYTHON_VERSIONS="2.7.15 3.5.5 3.6.6 3.7.0"

COPY install.sh /
RUN /install.sh

# release
FROM base AS release

COPY --from=build /root/.pyenv /root/.pyenv
