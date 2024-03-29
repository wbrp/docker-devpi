# docker-devpi

This repository contains a [`docker-compose.yml`](./docker-compose.yml), which can be used to build
2 docker images from 2 services, `devpi` and `nginx`, which share a named volume `server`.

The purpose of this image is to serve [devpi](https://github.com/devpi/devpi) with 
[nginx](https://www.nginx.com/). 

Both images are currently based on 
[`python:3.8.14-slim`](https://hub.docker.com/_/python/tags?page=1&name=3.8.14-slim).

The nginx webserver listens on the host port 80, which is mapped to 8080 in the container. You can 
change this by adjusting `proxy_set_header X-outside-url` in 
[`nginx/nginx.conf`](./nginx/nginx.conf), the port mapping in 
[`docker-compose.yml`](./docker-compose.yml) and [`nginx/Dockerfile`](./nginx/Dockerfile).

## Docker commands

### List images

    docker image ls

This shows info about images, such as their IDs.

### List containers (with total file sizes)

    docker container ls -s

### List volumes

    docker volume ls

### Build the images

    docker-compose build

To rebuild an image, just re-execute the previous command above. Note that this doesn't affect the 
volumes, i.e. they are not deleted, and, if you changed something in the directory that is mounted 
to a volume, the next time you rebuild the image and the container, you will still have your 
changes.

### Start a container

    docker-compose up -d

To recreate a container, just re-execute the previous command above. This also doesn't delete the 
existing volume.

### Delete an image

    docker image rm <image-id>

### Delete a container

1. `docker container stop <container-id>`
2. `docker container rm <container-id>`

### Delete a volume

    docker volume rm <volume-id>

### Delete all unused volumes

    docker volume prune

### Copy `/devpi/server` into a local folder on the host
    
    docker cp <container-id>:/devpi/server <host-destination-folder>

### Backup a volume

See [the documentation](https://docs.docker.com/storage/volumes/#backup-restore-or-migrate-data-volumes).

# License

[`MIT License`](./LICENSE.md)