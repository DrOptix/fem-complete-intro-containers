#!/bin/bash

# Cleanup
rm -vrf /work/chroot/root_a/*

# Use `debootstrap` to create a working minimal jail structure
debootstrap --variant=minbase bionic root_a/

# Create the secret file
echo "this is a secret" > ./root_a/secret.txt

cp tail.sh ./root_a/tail.sh

# Enter `root_a` jail
chroot root_a/ bash

