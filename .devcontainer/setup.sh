#!/usr/bin/env bash
set -euo pipefail

echo "==> Installing build dependencies..."
sudo apt-get update
sudo apt-get install -y \
    build-essential flex bison bc \
    libssl-dev libncurses-dev libelf-dev \
    cpio rsync unzip kmod

echo "==> Downloading toolchains into \$HOME..."
cd "$HOME"

if [ ! -d "clang-r353983c" ]; then
  echo "  -> clang-r353983c"
  curl -L -o clang.tar.gz \
    "https://github.com/ravindu644/Android-Kernel-Tutorials/releases/download/toolchains/clang-r353983c.tar.gz"
  mkdir -p clang-r353983c
  tar -xf clang.tar.gz -C clang-r353983c
  rm clang.tar.gz
fi

if [ ! -d "arm-gnu-toolchain-14.2.rel1-x86_64-aarch64-none-linux-gnu" ]; then
  echo "  -> arm-gnu-toolchain-14.2.rel1"
  curl -L -o gnu.tar.xz \
    "https://github.com/ravindu644/Android-Kernel-Tutorials/releases/download/toolchains/arm-gnu-toolchain-14.2.rel1-x86_64-aarch64-none-linux-gnu.tar.xz"
  tar -xf gnu.tar.xz
  rm gnu.tar.xz
fi
