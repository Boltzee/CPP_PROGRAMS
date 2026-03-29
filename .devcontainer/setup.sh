#!/bin/bash

## update and install some things we should probably have
apt-get update
apt-get install -y \
  curl \
  git \
  gnupg2 \
  jq \
  sudo \
  zsh \
  vim \
  build-essential \
  openssl \
  ssh \
  fish \
  tmux \
  xz-utils \
  wget \
  gcc \
  g++ \
  gdb \
  make \
  stow \
  locales \
  software-properties-common \
  kitty-terminfo

add-apt-repository -y ppa:zhangsongcui3371/fastfetch
apt-get update
apt-get install -y fastfetch

# Set locale
locale-gen en_US.UTF-8
update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
echo 'export LANG=en_US.UTF-8' >> ~/.bashrc

mkdir -p ~/.local/bin  # ← add this before the tar command
curl -LO https://ziglang.org/download/0.13.0/zig-linux-x86_64-0.13.0.tar.xz
tar -xf zig-linux-x86_64-0.13.0.tar.xz -C ~/.local/
ln -sf ~/.local/zig-linux-x86_64-0.13.0/zig ~/.local/bin/zig
