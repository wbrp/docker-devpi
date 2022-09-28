# docker-devpi

This repository contains a [`docker-compose.yml`](./docker-compose.yml), which can be used to build
2 docker images from 2 services, `devpi` and `nginx`, which share 2 named volumes `server` and 
`server-upgrade`. 

The purpose of this image is to server devpi with nginx. 

Both images are currently based on 
[`python:3.8.14-slim`](https://hub.docker.com/_/python/tags?page=1&name=3.8.14-slim).

This devpi container only works properly when being bound to port 80. Otherwise, you will need to 
adjust `proxy_set_header X-outside-url` in `nginx/nginx.conf`. See also the two dockerfiles under
the folders [`devpi`](./devpi) and [`nginx`](./nginx).

## Docker commands

### List images

    docker image ls

This shows info about images, such as their IDs.

### List containers (with total file sizes)

    docker container ls -s

### Build a new image

    docker-compose build

To rebuild an image, just re-execute the previous command above.

Volumes will not be affected.

### Start a container

    docker-compose up -d

To recreate a container, just re-execute the previous command above.

### List volumes

    docker volume ls

### Delete an image

    docker image rm <image-id>

### Delete a container

1. `docker container stop <container-id>`
2. `docker container rm <container-id>`

### Delete a volume

    docker volume rm <volume-id>

### Delete all unused volumes

    docker volume prune

# License

MIT License, see `LICENSE.md`.

[1]: http://doc.devpi.net/latest/quickstart-server.html#versioning-exporting-and-importing-server-state
