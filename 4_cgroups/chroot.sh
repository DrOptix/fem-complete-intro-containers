#!/bin/bash

# Enter secure `root_a` jail
unshare \
    --mount \
    --uts \
    --ipc \
    --pid \
    --fork \
    --user \
    --map-root-user \
    chroot ./root_a bash

