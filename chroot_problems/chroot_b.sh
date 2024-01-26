#!/bin/bash

# Cleanup
rm -vrf /work/chroot/root_b/*

# Use `debootstrap` to create a working minimal jail structure
debootstrap --variant=minbase bionic root_b/

cp kill_tail.sh ./root_b/kill_tail.sh
cp read_secret.sh ./root_b/read_secret.sh

# Enter `root_b` jail
chroot root_b/ bash
