FROM alpine:3.4
MAINTAINER Webrepublic Engineering <tech@webrepublic.com>

# Env vars
ENV PYTHONUNBUFFERED=1

# Dependencies
RUN apk add --update python3 py-pip

# Install devpi
RUN pip3 install \
    "devpi-server>=4.0.0,<4.1" \
    "devpi-web>=3.1.0,<3.2" \
    "devpi-client>=2.6.3,<2.7"

# Server directory
RUN adduser -D devpi \
    && mkdir /devpi \
    && chown -R devpi:devpi /devpi

# Copy static files
RUN cp -R /usr/lib/python3.5/site-packages/devpi_web/static /devpi/+static

# Add upgrade script
ADD upgrade.sh /devpi/

# Expose volume
VOLUME ["/devpi/server"]

# Change to unprivileged user
USER devpi

# Entry point
EXPOSE 4040
CMD ["devpi-server", \
     "--host", "0.0.0.0", \
     "--port", "4040", \
     "--serverdir", "/devpi/server", \
     "--restrict-modify", "root"]
