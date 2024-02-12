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

### Docker Features

This section show docker feature like bind mounts, volume mounts, networks and how they can be usefull to setup docker development containers.

An example of running two containers on the same network, a server and a client.

    - Run the server using `./run_mongo_db_server.sh`
    - Run the client with `./run_mongo_db_client.sh`
    - This will open a REPL and you will be able to interact with the Mongo server.

### Multi Container Projects

Here we have POC of using Docker Compose, then later Kompose to create Kubernetes deployment script based on the Docker Compose files.

Docker compose example:

    - Run `./compse_nodemon.sh`

This will run an attached Docker Compose setting up a Mongo DB server and a web application that is server on `http://localhost:3000`, going to `http://localhost:3000/add` will count how many times we accessed the link and will save this in the Mongo DB.

What is interesting is the usage of `nodemon` to serve the web application. Everytime we change the code of the application.

The example for Kubernetes is more complicated, but in short in `./kompose_kompose.sh`, we start `minikube`, setup a tunnel to `minikube` so the load balancer can be reached from the host, convert docker compose to kubernets files, do a kubernets deployment, scale the web container to 5 instances.

The application can be accessed from the host on an url like `http://192.168.49.2:32695`, the port varies so you must check the output of `./kompose_kompose.sh`.

To clean everythin up use `./destroy_kompose.sh`.

Kubernetes is quite complicated and I want to learn more, especially the scale up and scale down aspects of it, but here is not the place for it.

    > Tip: if you have problems entering `sudo` password when setting up the minikube tunnel, just do an `sudo echo` to setup a `sudo` session.
