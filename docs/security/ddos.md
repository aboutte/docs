https://www.linuxjournal.com/content/back-dead-simple-bash-complex-ddos

```
#! /bin/bash
while [ 1 ] ;
 do
 for ip in `lsof -ni | grep httpd | grep -iv listen | awk '{print $8
}' | cut -d : -f 2 | sort | uniq | sed s/"http->"//` ;
 # the line above gets the list of all connections and connection
attempts, and produces a list of uniq IPs
 # and iterates through the list
  do
    noconns=`lsof -ni | grep $ip | wc -l`;
    # This finds how many connections there are from this particular IP address
    echo $ip : $noconns ;
    if [ "$noconns" -gt "10" ] ;
    # if there are more than 10 connections established or connecting
from this IP
    then
      # echo More;
      # echo `date` "$ip has $noconns connections.  Total connections
to prod spider:  `lsof -ni | grep httpd | grep -iv listen | wc -l`" >>
/var/log/Ddos/Ddos.log
      # to keep track of the IPs uncomment the above two lines and
make sure you can write to the appropriate place
      iptables -I INPUT -s $ip -p tcp -j REJECT --reject-with tcp-reset
      # for these connections, add an iptables statement to send
resets on any packets recieved
    else
        # echo Less;
    fi;
  done
sleep 60
done
```
