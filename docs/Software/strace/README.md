# strace

The following are some of the useful switches

-t          Prefix each line of the trace with the time of day.

-tt         If given twice, the time printed will include the microseconds.

-ttt        If given thrice, the time printed will include the microseconds and the leading portion will be printed as the number of seconds since the epoch.

-T          Show the time spent in system calls. This records the time difference between the beginning and the end of each system call.

-r          Print a relative timestamp upon entry to each system call.  This records the time difference between the beginning of successive system calls.

-C          Count  time, calls, and errors for each system call and report a summary on program exit.

-f          Trace  child  processes  as they are created by currently traced processes
