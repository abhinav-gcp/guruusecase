# Use a specific version of Ubuntu as a base image
FROM ubuntu:20.04

# Set non-interactive frontend to avoid timezone prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install Apache, clean up package lists to reduce image size, and configure Apache
RUN apt-get update && \
    apt-get install -y apache2 && \
    echo '<h1>Hello World from Apache!</h1>' > /var/www/html/index.html && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Expose port 80 for Apache
EXPOSE 80

# Start Apache in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]

