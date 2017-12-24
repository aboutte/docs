# disk throughput

## hdparm supports testing read speed (hdparm linux only)
   hdparm -tT /dev/sda

## dd
dd can be used to test read and write speed.  I have a script in dotfiles repo for this
    disk_performance "/Volumes/media/andy/testfile"

# network

client
    time iperf --num 1GB --interval 5 --client rtr.andyboutte.com --format M -P 5

server
     iperf -s

## bidirection test (throughput)

add -d switch to client

## parallel streams

add -P 2 to client



# calculating max throughput

- http://bradhedlund.com/2008/12/19/how-to-calculate-tcp-throughput-for-long-distance-links/
- max TCP window size is 64KB = 65536 Bytes. 65536 * 8 = 524288 bits
- actual TCP window size being used can be retrieved from Wireshark

- use tcptrace to capture the TCP RTT
- max window size / RTT = throughput

example: 524288 bits / 0.030 (30ms RTT) seconds = 17476266 bits per second throughput = 17.4 Mbps maximum possible throughput




(TCP Window Size / (RTT ms / 1000) ) / 1000000 = real world throughput in Mbps


Bandwidth (Mbit/s) = ((65535 * 8)/(RTT latency in ms/1000))/1000000





# tcptrace

http://prefetch.net/blog/index.php/2006/04/17/debugging-tcp-connections-with-tcptrace/

tcptrace tcpdump.pcap
tcptrace -r -l -o7 ec2.pcapng

tcptrace -houtput # describes the output from -l
