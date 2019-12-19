#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# options
BRANCH_TO_BUILD="master"
ls -la /root/.ssh


# Prerequisites / utils for fletch
apt-get update -y

apt install -y --no-install-recommends -y $(tr ' ' '\n' <<EOM
build-essential
cmake
cmake-curses-gui
git
libatlas-base-dev
libexpat1-dev
libgl1-mesa-dev
liblapack-dev
libreadline-dev
libxt-dev
ninja-build
pkgconf
python3
python3-distutils
python-dev
python-numpy
python-pip
python-scipy
ssh
vim
zlib1g-dev
EOM
)

git clone -b "${BRANCH_TO_BUILD}" \
    --single-branch git@github.com:Kitware/fletch.git fletch

pushd fletch
mkdir build_ninja
pushd build_ninja

export MAKEFLAGS="-j16"

cmake \
-GNinja \
-DCMAKE_BUILD_TYPE:STRING=Debug \
-Dfletch_ENABLE_ALL_PACKAGES=ON \
-DGDAL_SELECT_VERSION="2.3.2" \
-DVTK_SELECT_VERSION="8.0" \
-DCMAKE_INSTALL_PREFIX="$PWD/install" \
..

cmake --build . |& tee output_log.txt

popd
popd
