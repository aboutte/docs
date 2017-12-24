# remote capture of packets for pfsense

rm /tmp/remotecapture.fifo; mkfifo /tmp/remotecapture.fifo; wireshark -kni /tmp/remotecapture.fifo&

ssh root@rtr.andyboutte.com tcpdump -s 0 -n -w - -U -i any > /tmp/remotecapture.fifo


# remote capture of packets for amazon linux

run the following on the ec2

yum install wireshark tcpdump
groupadd pcap
usermod -a -G pcap ec2-user
chgrp pcap /usr/sbin/tcpdump
chmod 750 /usr/sbin/tcpdump
setcap cap_net_raw,cap_net_admin=eip /usr/sbin/tcpdump

(might need to update /etc/sudoers to allow %wheel passwordless access)

run the following locally on workstation

ssh ec2-user@ec2-52-40-43-38.us-west-2.compute.amazonaws.com /usr/sbin/tcpdump -s 0 -n -w - -U -i eth0 port 9091 > /tmp/remotecapture.fifo
