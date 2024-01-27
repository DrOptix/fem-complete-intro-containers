#!/bin/bash

# Cleanup
rm -vrf /work/chroot/root_b/*

# Use `debootstrap` to create a working minimal jail structure
debootstrap --variant=minbase bionic ./root_b/

cp read_secret.sh ./root_b/read_secret.sh

# Enter secure `root_b` jail
unshare \
    --mount \
    --uts \
    --ipc \
    --net \
    --pid \
    --fork \
    --user \
    --map-root-user \
    chroot ./root_b bash


