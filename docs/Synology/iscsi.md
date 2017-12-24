iqn.2000-01.com.synology:synology.Target-11.7887d99f77 - aboutte
iqn.2000-01.com.synology:synology.Target-12.7887d99f77 - kboutte
iqn.2000-01.com.synology:synology.Target-13.7887d99f77 - kvm



log into target

iscsiadm -m node -l

list sessions

iscsiadm -m session -P 3




http://opentodo.net/2012/10/setup-iscsi-target-initiator-on-centos-6/
https://www.synology.com/en-us/knowledgebase/DSM/tutorial/Virtualization/How_to_set_up_and_use_iSCSI_target_on_Linux

[root@www ~]# yum -y install iscsi-initiator-utils
[root@www ~]# vi /etc/iscsi/initiatorname.iscsi
# change to the same IQN you set on the iSCSI target server
InitiatorName=iqn.2014-07.world.srv:www.srv.world


discover targets on iscsi server:

iscsiadm --mode discovery -t sendtargets --portal 192.168.0.7

list what targets are mounted:

iscsiadm --mode session --op show

From OS perspective list iscsi targets:

fdisk -l

remove iscsi target:

iscsiadm --m node -T iqn.2000-01.com.synology:synology.Target-11.7887d99f77 --portal 192.168.0.7:3260 -u
