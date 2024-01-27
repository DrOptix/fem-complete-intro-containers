FROM ubuntu:bionic

# Create chroot playground
RUN mkdir -p /work/chroot/new_root/

WORKDIR /work/chroot/

# Create chroot.sh
COPY chroot.sh ./chroot.sh
RUN chmod +x ./chroot.sh

