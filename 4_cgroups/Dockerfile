FROM ubuntu:bionic

# Use `bash` as default `sh` is not nice
SHELL ["/bin/bash", "-c"]

# Install debootstrap
RUN apt-get update
RUN apt-get install -y \
    debootstrap \
    cgroup-tools \
    htop

# Create chroot playground
RUN mkdir -p /work/chroot/root/

WORKDIR /work/chroot/

# Setup `root_a`
ADD bionic ./root

COPY setup_cgroups.sh ./setup_cgroups.sh

COPY chroot.sh ./chroot.sh
COPY spam_cpu.sh ./root/spam_cpu.sh
COPY spam_memory.sh ./root/spam_memory.sh
