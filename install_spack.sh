#!/bin/bash

git clone --depth=100 https://github.com/spack/spack.git ~/spack

echo "source ~/spack/share/spack/setup-env.sh" >> ~/.zshrc
