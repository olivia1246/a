#!/bin/sh

# Start QEMU in the background
qemu-system-x86_64 -m 256 -boot d -cdrom /qemu/images/hirensbootcd.iso -device qxl -cpu core2duo,+sse3,+sse4.1,+sse4.2 -smp cores=2 -accel tcg -M pc -netdev user,id=lan -device rtl8139,netdev=lan -usb -device usb-tablet -rtc base=localtime -monitor stdio -vnc :0 &
# -drive file=/qemu/images/disk.qcow2,format=qcow2

# Start noVNC
/opt/novnc/utils/novnc_proxy --vnc localhost:5900 --listen 6080
