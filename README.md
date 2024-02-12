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

### cgroups

Using `cgroups` we can set quotas on memory, CPU, devices etc.

We need to have installed `cgroup-tools` or whatever name it has for your distro.

_TODO_: Find a solution for `libcgroup initialization failed: Cgroup is not mounted`.

### Dockerfile

We present 3 ways to use a Dockerfile. All of them are running an `index.js` using Node from inside the container.

1. We use a Node image directly to run our application.

   - Build the image using `./build_node.sh`
   - Run the image using `./run_node.sh`

2. We use a Debian image as base and we create a Node container from scratch to run our application.

   - Build the image using `./build_node_complex.sh`
   - Run the image using `./run_node_complex.sh`
   - This will expose on `https://localhost:3000` our Node application

3. We use a Debian image as base and we create a Node container from scratch to run our application.

   The steps from the docker file, `node_optimized_build.dockerfile`, are placed in such an order that `npm ci` step will be cached by docker most of the time.

   The volatile layer, ` COPY --chown=node:node ./node_complex ./`, being after `RUN npm ci`, will not trigger a full image rebuild, the heavy lifting being already cached.

   - Build the image using `./build_oprimized_build.sh`
   - Run the image using `./run_optimized_build.sh`
   - This will expose on `https://localhost:3000` our Node application

### Tiny Containers

The same idea as in `Dockerfiles` section. The difference is that we focus on small container images. There are two approaches. Use Alpine Linux small images only, or we can use a two stage setup where we have a `build` stage in our docker file where we use a fat docker image. Then we build the production image based on Alpine Linux.

Example of a two stage docker file:

    - Build the image using: `./build_node_multi_stage.sh`
    - Run the image using: `./run_node_multi_stage.sh`
    - This will expose on `https://localhost:3000` our Node application
