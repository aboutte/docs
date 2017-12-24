http://techblog.netflix.com/2015/11/linux-performance-analysis-in-60s.html


```
yum install strace iotop sysstat
```

```
uptime
dmesg | tail
vmstat -w 1
mpstat -P ALL 1
pidstat 1
iostat -xz 1 (if high io found use "iotop -o -d 5" to find process)
free -m
sar -n DEV 1
sar -n TCP,ETCP 1
top
```
