FROM alpine:3.4
MAINTAINER Webrepublic Engineering <tech@webrepublic.com>

# Env vars
ENV PYTHONUNBUFFERED=1

# Server directory
RUN adduser -D devpi \
    && mkdir -p /devpi/server /devpi/server-upgrade \
    && chown -R devpi:devpi /devpi

# Entry point, simply exit with status code 0
CMD ["/bin/true"]
