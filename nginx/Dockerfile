FROM alpine:3.2
MAINTAINER Danilo Bargen <mail@dbrgn.ch>

# Dependencies
RUN apk add --update nginx

# Copy config file
COPY ["nginx.conf", "auth.conf", "htpasswd", "/etc/nginx/"]
RUN chown root:nginx /etc/nginx/htpasswd && chmod 660 /etc/nginx/htpasswd

# Change to unprivileged user
USER nginx

# Entry point
EXPOSE 8080
CMD ["nginx"]
