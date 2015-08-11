# A DevPi Docker Setup

This Docker Compose based setup runs DevPi behind Nginx.

The images are based on [Alpine Linux][0], which
enables far smaller images than Debian or the Python image.

## Building images

    $ docker-compose build

## Starting containers

    $ docker-compose up -d

## Recreating / updating containers

Rebuild them with ``docker-compose build``, then recreate the containers with
``docker-compose up -d``. Volumes will not be affected.

## Upgrading to a new major Devpi version

To upgrade Devpi, you need to [export and re-import the data][1].

    $ export DUMPDIR=dump-$(date +%Y%m%d-%H%M%S)
    $ docker run --rm \
        --volumes-from=dockerdevpi_devpi_1 \
        -v $(pwd):/dump \
        dockerdevpi_devpi \
        devpi-server --export /dump/$DUMPDIR

Now you have a folder called `dump-$timestamp` in your current directory.

Stop and delete all containers:

    $ docker-compose stop
    $ docker-compose rm

Rebuild the containers:

    $ docker-compose build

Start devpi in idle mode, so we can use its volume

    $ docker-compose run -d devpi tail -f /bin/sh

Import the old server state:

    $ export DUMPDIR=<name-of-dump-directory>
    $ docker run --rm \
        --volumes-from=dockerdevpi_devpi_run_1 \
        -v $(pwd)/$DUMPDIR:/dump \
        dockerdevpi_devpi \
        devpi-server --serverdir /devpi/server --import /dump

Now stop the idle devpi container and start the setup in regular configuration:

    $ docker kill -s=INT dockerdevpi_devpi_run_1
    $ docker rm dockerdevpi_devpi_run_1
    $ docker-compose up -d

[0]: https://hub.docker.com/_/alpine/
[1]: http://doc.devpi.net/latest/quickstart-server.html#versioning-exporting-and-importing-server-state
