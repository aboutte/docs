# Setting up Raspberry Pi as Stratum 0 NTP Server

Raspbery Pi = B v1.2
Raspian = Raspian Jessie Lite; Version:November 2016; Release date:2016-11-25; Kernel version:4.4


connect gps to pins 4 6 8 10 12

    sudo apt-get install picocom pps-tools ntp

Common commands:

Check status of ntp:

    ntpq -p

Check status of gps:

    cgps -s

 sudo gpsd /dev/gps0 -D -n -N -F /var/run/gpsd.sock    

capturing ntp requests:

    rm /tmp/remotecapture.fifo; mkfifo /tmp/remotecapture.fifo; wireshark -kni /tmp/remotecapture.fifo&
    ssh ntp.andyboutte.com sudo /usr/sbin/tcpdump -s 0 -n -w - -U -i wlan0 port 123 > /tmp/remotecapture.fifo


https://frillip.com/raspberry-pi-stratum-1-ntp-server/
https://www.eecis.udel.edu/~mills/ntp/html/refclock.html - description of each ntp driver (127.127.5.1)
http://mythopoeic.org/pi-ntp/
