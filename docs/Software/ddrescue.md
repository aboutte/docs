https://www.technibble.com/guide-using-ddrescue-recover-data/

# Mac

    brew install ddrescue
    diskutil list
    ddrescue -v /dev/disk0s2 image.img ddrescue.log

# Linux (Parted Magic)

Mount NFS storage with this command

    mkdir /mnt/nfs
    mount -t nfs synology.andyboutte.com:/volume1/media /mnt/nfs

Find disks

    lsblk -o name,label,size,fstype,model

Run ddrescue

    ddrescue -vd -r3 /dev/sda /mnt/nfs/test.img /mnt/nfs/test.logfile

# restore the .img file

    dd if=test.img of=/dev/sda

Or if you created the .img of a single partition you can mount that disk image and
use Carbon Copy Cloner to restore all the files to a new hard drive that has an empty partition
