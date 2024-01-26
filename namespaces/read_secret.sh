#!/bin/bash

mount -t proc proc /proc

target_pid=$(pgrep --full "secret.txt")
cat "/proc/$target_pid/fd/3"
