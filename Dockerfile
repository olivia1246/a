# Use Alpine Linux as the base image
FROM alpine:latest

# Install necessary packages
RUN apk add --no-cache \
    qemu-system-x86_64 \
    qemu-img \
    git \
    python3 \
    py3-pip \
    nodejs \
    npm \
    bash

# Set up a directory for QEMU images
RUN mkdir -p /qemu/images

# Download a disk file for testing (you can replace this with your preferred image)
RUN wget -O /qemu/images/linux.iso \
    https://dl-cdn.alpinelinux.org/alpine/v3.20/releases/x86_64/alpine-standard-3.20.3-x86_64.iso

# Create a QEMU disk image
# RUN qemu-img create -f qcow2 /qemu/images/disk.qcow2 10G

# Clone noVNC
RUN git clone https://github.com/novnc/noVNC.git /opt/novnc

# Install noVNC dependencies
RUN cd /opt/novnc && npm install

# Expose noVNC port
EXPOSE 6080

# Set up the start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Start the services
CMD ["/start.sh"]
