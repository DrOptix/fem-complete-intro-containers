FROM fedora:39

# Create chroot playground
WORKDIR /work/chroot/

# Install debootstrap
RUN dnf install -y debootstrap libcgroup-tools htop
RUN debootstrap --variant=minbase jammy ./root

COPY chroot.sh ./chroot.sh
# COPY debootstrap.sh ./debootstrap.sh
COPY setup_cgroups.sh ./setup_cgroups.sh
COPY delete_cgroups.sh ./delete_cgroups.sh

COPY spam_cpu.sh ./root/spam_cpu.sh
COPY spam_memory.sh ./root/spam_memory.sh
