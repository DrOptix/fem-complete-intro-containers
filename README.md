# fem-complete-intro-containers

Playground for https://frontendmasters.com/courses/complete-intro-containers/

### chroot

Exemple on how to setup a jail for a process using `chroot`.

The example is meant to be executed inside a `docker` container.

### chroot_problems

Exemple on how to setup two jails for a process using `chroot`. The content of a jail is generated with `debootstrap` tool for a better minimal base.

- Execute `./run.sh` to build the `docker` image and spin a playground container
- From inside this container run `./chroot_a.sh` wait for it to launch a `bash` shell.
- Execute `./tail.sh`
- Execute `./attach.sh` to start a new `bash` shell in the playground container
- From inside this container run `./chroot_b.sh` wait for it to launch a `bash` shell.
- Execute `./read_secret.sh`. This one will search for the `tail` process, get it's PID and use that to read the secret from `/proc/<PID>/3`.
- QED

Now we can clearly see one of the biggest limitations of simple `chroot` containers.

### namespaces

Starting from `chroot_problems` we make use of `unshare` tool to disable passtrough of mounts, network, process manager etc to the containers we start in `root_a` and `root_b`.

- Execute `./run.sh` to build the `docker` image and spin a playground container
- From inside this container run `./chroot_a.sh` wait for it to launch a `bash` shell.
- Execute `./tail.sh`
- Execute `./attach.sh` to start a new `bash` shell in the playground container
- From inside this container run `./chroot_b.sh` wait for it to launch a `bash` shell.
- Execute `./read_secret.sh`
- Profit, `root_b` process can't read stuff from `root_a` file descriptor.
