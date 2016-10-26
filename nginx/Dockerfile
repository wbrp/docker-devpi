FROM alpine:3.4
MAINTAINER Webrepublic Engineering <tech@webrepublic.com>

# Dependencies
RUN apk add --update nginx

# Copy config file
COPY ["nginx.conf", "/etc/nginx/"]

# Change to unprivileged user
USER nginx

# Entry point
EXPOSE 8080
CMD ["nginx"]
