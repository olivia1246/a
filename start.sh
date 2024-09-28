#!/bin/sh

# Start QEMU in the background
qemu-system-x86_64 -m 256 -boot d -cdrom /qemu/images/linux.iso \
    #-drive file=/qemu/images/disk.qcow2,format=qcow2 -vnc :0 &

# Start noVNC
/opt/novnc/utils/novnc_proxy --vnc localhost:5900 --listen 6080
