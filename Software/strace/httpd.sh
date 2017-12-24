#!/bin/bash

ps aux | grep httpd | grep -v grep | awk '{print"-p " $2}' | xargs strace -ttt -T -C -f -o /var/log/strace
