# Use Ubuntu 20.04 as the base image
FROM ubuntu:20.04

# Install OpenJDK and other dependencies
RUN apt-get update && \
    apt-get install -y nginx curl && \
    rm -rf /var/lib/apt/lists/*

# Copy the Nginx config
COPY default /etc/nginx/sites-available/default
COPY finexo-html/. /usr/share/nginx/html

# Expose the port for access
EXPOSE 80/tcp

# Run the Nginx server
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
