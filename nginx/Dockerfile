FROM python:3.8.14-slim
MAINTAINER Webrepublic Engineering <tech@webrepublic.com>

# Update software.
RUN apt-get update
RUN apt-get dist-upgrade -y

# Install nginx.
RUN apt-get install nginx -y

# Copy the nginx config file.
COPY ["nginx.conf", "/etc/nginx/"]

# The container listens on this port at runtime.
EXPOSE 8080

CMD ["nginx"]
