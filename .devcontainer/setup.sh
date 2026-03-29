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
  gpg \
  unzip \
  kitty-terminfo

# Install eza
apt-get install -y gpg
mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | tee /etc/apt/sources.list.d/gierens.list
chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
apt-get update
apt-get install -y eza

# Install bat
BAT_VERSION=$(curl -s "https://api.github.com/repos/sharkdp/bat/releases/latest" | grep -Po '"tag_name": *"v\K[^"]*')
curl -LO "https://github.com/sharkdp/bat/releases/download/v${BAT_VERSION}/bat_${BAT_VERSION}_amd64.deb"
dpkg -i bat_${BAT_VERSION}_amd64.deb
rm bat_${BAT_VERSION}_amd64.deb

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
