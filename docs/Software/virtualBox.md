# virtualBox


### Using physical disk in virtualBox

Normally with virtualBox you install the OS to a virtual disk.  virtualBox can be configured to install the OS to a physical disk.  These are the steps to do that:

- ```diskutil list```
- get device id of USB hard drive
- ```sudo chown aboutte /dev/disk3*```
- ```VBoxManage internalcommands createrawvmdk -filename ~/Desktop/pfsense.vmdk -rawdisk /dev/disk3```
- in virtualBox create a VM but don't add a virtual disk
- in the settings add an existing hard drive and select ~/Desktop/pfsense.vmdk
