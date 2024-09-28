#!/bin/sh

# Start QEMU in the background
qemu-system-x86_64 -m 256 -boot d -cdrom "/qemu/images/Hiren's.BootCD.15.2.iso" -device qxl -cpu host -accel kvm -M pc -netdev user,id=lan -device rtl8139,netdev=lan -usb -device usb-tablet -rtc base=localtime -monitor stdio -vnc :0 &
# -drive file=/qemu/images/disk.qcow2,format=qcow2

# Start noVNC
/opt/novnc/utils/novnc_proxy --vnc localhost:5900 --listen 6080
