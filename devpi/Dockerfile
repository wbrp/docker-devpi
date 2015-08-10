FROM alpine:3.2
MAINTAINER Danilo Bargen <mail@dbrgn.ch>

# Env vars
ENV PYTHONUNBUFFERED=1

# Dependencies
RUN apk add --update python3 py-pip

# Install devpi
RUN pip3 install \
    "devpi-server>=2.2,<2.3" \
    "devpi-web>=2.4.0,<2.5" \
    "devpi-client>=2.3.0,<2.4"

# Server directory
RUN adduser -D devpi \
    && mkdir /devpi \
    && chown -R devpi:devpi /devpi
VOLUME ["/devpi"]

# Copy static files
RUN ln -s /usr/lib/python3.4/site-packages/devpi_web/static /devpi/+static

# Change to unprivileged user
USER devpi

# Entry point
EXPOSE 4040
CMD ["devpi-server", "--host", "0.0.0.0", "--port", "4040", "--serverdir", "/devpi"]
