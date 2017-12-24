kvm

Convert raw to qcow2

http://www.itdesignhouse.com/convert-kvm-virtual-machine-raw-qcow2-format/

qemu-img convert -f raw -O qcow2 /home/libvirt/images/rhel01.img /home/libvirt/images/rhel01.qcow2


snapshot vm

https://github.com/bioinformatics-ptp/kvmBackup/wiki/Create-a-snapshot





find /backup/logs/* -type f -maxdepth 0 -mtime +7 -exec rm -f {} \;