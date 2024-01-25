#!/bin/bash

# Cleanup
rm -vrf /work/chroot/new_root/*

# Create folder hierarchy
mkdir -vp /work/chroot/new_root/bin/
mkdir -vp /work/chroot/new_root/lib/x86_64-linux-gnu/
mkdir -vp /work/chroot/new_root/lib64/

# Copy `bash` and dependencies
cp -v /bin/bash ./new_root/bin/
cp -v /lib/x86_64-linux-gnu/libtinfo.so.5 \
    /lib/x86_64-linux-gnu/libdl.so.2 \
    /lib/x86_64-linux-gnu/libc.so.6 \
    ./new_root/lib/x86_64-linux-gnu/
cp -v /lib64/ld-linux-x86-64.so.2 \
    ./new_root/lib64/

# Copy `ls` and dependencies
cp -v /bin/ls ./new_root/bin/
cp -v /lib/x86_64-linux-gnu/libselinux.so.1 \
    /lib/x86_64-linux-gnu/libpcre.so.3 \
    /lib/x86_64-linux-gnu/libpthread.so.0 \
    ./new_root/lib/x86_64-linux-gnu/

# Copy `cat` and dependencies
cp -v /bin/cat ./new_root/bin/

# Start `bash` jailed to `new_root`
chroot new_root bash
