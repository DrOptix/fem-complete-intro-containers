#!/bin/bash

# Enter secure `root` jail
unshare \
    --mount \
    --uts \
    --ipc \
    --pid \
    --fork \
    --user \
    --map-root-user \
    chroot ./root bash

