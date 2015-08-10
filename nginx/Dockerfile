FROM alpine:3.2
MAINTAINER Danilo Bargen <mail@dbrgn.ch>

# Dependencies
RUN apk add --update nginx

# Copy config file
ADD nginx.conf /etc/nginx/nginx.conf

# Entry point
EXPOSE 80
CMD ["nginx"]
