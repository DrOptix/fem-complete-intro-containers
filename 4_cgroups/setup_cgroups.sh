#!/bin/bash

mount -t proc none /proc

# Create a new cgroup
cgcreate -g cpu,memory:sandbox

# Add the jail to the cgroup
# TODO: Find a way to get the jail PID automatically
cgclassify -g cpu,memory:sandbox $1

# List tasks associated to the sandbox cgroup, we should
# see the above PID
cat /sys/fs/cgroup/cpu/sandbox/tasks

# Limit usage at 5% for a multi core system
cgset -r cpu.cfs_period_us=100000 \
    -r cpu.cfs_quota_us=$[ 5000 * $(getconf _NPROCESSORS_ONLN) ] \
    sandbox

# Set a limit of 80M
cgset -r memory.limit_in_bytes=80M sandbox
