FROM ubuntu:bionic

# Install debootstrap
RUN apt-get update
RUN apt-get install debootstrap -y

# Create chroot playground
RUN mkdir -p /work/chroot/root_a/
RUN mkdir -p /work/chroot/root_b/

WORKDIR /work/chroot/

# Create the secret file
RUN echo "this is a secret" > ./root_a/secret.txt

# Create chroot.sh
COPY chroot_a.sh ./chroot_a.sh
RUN chmod +x ./chroot_a.sh

COPY chroot_b.sh ./chroot_b.sh
RUN chmod +x ./chroot_b.sh


COPY chroot_tail.sh ./tail.sh
RUN chmod +x ./tail.sh

COPY chroot_kill_tail.sh ./kill_tail.sh
RUN chmod +x ./kill_tail.sh
