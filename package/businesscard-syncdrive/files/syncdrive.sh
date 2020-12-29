#! /bin/sh

case "$1" in
        usb|"")
                umount /mnt > /dev/null 2>&1
                echo '' > /sys/class/udc/musb-hdrc.1.auto/device/gadget/lun0/file
		echo 0 > /sys/class/udc/musb-hdrc.1.auto/device/gadget/lun0/ro
		echo /dev/mtdblock1 > /sys/class/udc/musb-hdrc.1.auto/device/gadget/lun0/file
                ;;
        mount)
                echo '' > /sys/class/udc/musb-hdrc.1.auto/device/gadget/lun0/file
		mount /dev/mtdblock1 /mnt
                ;;
        *)
                echo "Usage: flashdrive {usb|mount}" >&2
                exit 1
                ;;
esac
