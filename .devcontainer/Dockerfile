#
# Copyright © 2024 inpyjama.com. All Rights Reserved.
# Author: Piyush Itankar <piyush@inpyjama.com>
#

FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu

ENV DEBIAN_FRONTEND=noninteractive
ENV TERM xterm

# Install system tools and development packages
RUN apt-get update && apt-get install --no-install-recommends -y \
  sudo \
  binutils-common \
  make \
  git-core \
  wget \
  tree \
  build-essential \
  python3 \
  python3-dev \
  python3-venv \
  pipx \
  binutils \
  qemu-system-arm \
  gcc-arm-none-eabi \
  gdb-multiarch \
  gcc-riscv64-unknown-elf \
  ca-certificates \
  curl \
  nano \
  ssh \
  less \
  binutils-riscv64-linux-gnu \
  qemu-system-riscv32 \
  zsh \
  xxd \
  strace \
  man && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

# Set up pipx to install CLI tools like pygmentize
ENV PIPX_HOME=/usr/local/pipx
ENV PATH=$PIPX_HOME/bin:$PATH

# Install Pygments via pipx safely
RUN pipx install pygments

# Download gdb-dashboard
RUN wget -O /root/.gdbinit https://raw.githubusercontent.com/cyrus-and/gdb-dashboard/master/.gdbinit
