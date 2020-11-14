#!/bin/bash

set -eux

DIR=$(readlink -f $1)

FILES_DIR=$DIR

cd $HOME
#sudo apt update && sudo apt upgrade -y

# obfuscator
## https://github.com/obfuscator-llvm/obfuscator/wiki/Installation
sudo apt install cmake make gcc g++ gcc-multilib git -y
git clone -b llvm-4.0 https://github.com/obfuscator-llvm/obfuscator.git $FILES_DIR/obfuscator
cd $FILES_DIR/obfuscator
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DLLVM_INCLUDE_TESTS=OFF ..
NUM_JOBS=$((`nproc`/2 ))
make -j$(( NUM_JOBS > 1 ? NUM_JOBS : 1 ))
sudo make install

# pip
sudo apt install curl python3-distutils python3-testresources -y
cd /tmp
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py
source ~/.profile # for adding path to ~/.local/bin

# additional required packages
pip install notebook future networkx z3-solver pyparsing pydotplus

# miasm
## as of fc6bb3ce49ea44012a762b207a39301825e9648a
git clone https://github.com/cea-sec/miasm $FILES_DIR/miasm
sudo apt install python3 libpython3-dev python3-distutils graphviz jupyter-notebook -y
cd $FILES_DIR/miasm
python3 setup.py build
sudo python3 setup.py install

# docker
## https://docs.docker.com/install/linux/docker-ce/ubuntu/
sudo apt install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io -y

# tigress
cd $FILES_DIR/tigress-docker
export DOCKER_BUILDKIT=1
sudo docker build . -t tigress-docker

