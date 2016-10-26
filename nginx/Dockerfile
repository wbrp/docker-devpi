FROM alpine:3.2
MAINTAINER Danilo Bargen <mail@dbrgn.ch>

# Dependencies
RUN apk add --update nginx

# Copy config file
COPY ["nginx.conf", "/etc/nginx/"]

# Change to unprivileged user
USER nginx

# Entry point
EXPOSE 8080
CMD ["nginx"]
