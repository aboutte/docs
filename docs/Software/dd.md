dd if=/dev/hda of=~/hdadisk.img

If dd does not work try unetbootin

sudo umount /dev/disk3
sudo diskutil eraseDisk FAT32 NAME MBRFormat /dev/disk3

a fat32 usb stick should show up in unetbootin
