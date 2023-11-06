#!/usr/bin/env bash

for d in $(ls -d */);
do
    CMD="stow --target=${HOME} ${d}"
    echo "running: ${CMD}"
    ${CMD}
done
