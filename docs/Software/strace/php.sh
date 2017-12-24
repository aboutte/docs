#!/bin/bash

strace -ttt -T -C -f -o /var/log/strace php /path/to/php/script/script.php arg1 arg2
