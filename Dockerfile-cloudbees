# base
FROM cloudbees/java-with-docker-client:latest AS base

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

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git \
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

COPY fetch-pyenv.sh /
RUN /fetch-pyenv.sh

ENV PYTHON_VERSIONS="2.7.15 3.5.5 3.6.6 3.7.0"

COPY install.sh /
RUN /install.sh

# release
FROM base AS release

COPY --from=build /root/.pyenv /root/.pyenv
