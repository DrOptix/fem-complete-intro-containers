FROM ubuntu:bionic

# Create chroot playground
RUN mkdir -p /work/chroot/new_root/

# Create chroot.sh
COPY chroot.sh /work/chroot/chroot.sh
RUN chmod +x /work/chroot/chroot.sh

# Create the secret file
RUN echo "this is a secret" > /work/chroot/new_root/secret.txt


WORKDIR /work/chroot/
