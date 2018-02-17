# Personal Backup Review

My personal CrashPlan subscription is expiring in January 2018.  I need to find a replacement backup solution.  
I currently have an Unlimited Family subscription with CrashPlan and backup ~5 machines with ~1.5TB of data.

## Requirements

1. High
    1. Cross platform - Mac and Linux at a minimum
    2. Custom encryption key
    3. Scheduled
2. Medium
    1. 3-2-1 Backup Strategy - 3 copies, two local on different devices, and one remote
    2. Central reporting (dashboard) or notifications
    3. CLI
    4. Baremetal restore

## Backup Software

| Name | 1.a | 1.b | 1.c | 2.a | 2.b | 2.c |
|------|-----|-----|-----|-----|-----|-----|
| [Arq](https://www.arqbackup.com/)	| N | Y | | Y | | N |
| [Bacula](https://blog.bacula.org/) | |
| [Burp](http://burp.grke.org/)||
| [Borg](https://borgbackup.readthedocs.io/en/stable/)|
| [CloudBerry](https://www.cloudberrylab.com/)||
| [Duplicacy](https://github.com/gilbertchen/duplicacy)|	 |
| [Duplicity](http://duplicity.nongnu.org/ ) | Y | Y | N | Y | N | Y |
| [Duplicati](https://www.duplicati.com/)||
| [urbackup](https://www.urbackup.org/)	| |
| [Wasabi](https://wasabi.com)||



## Notes

### Arq

#### Section 1.a

Arq has no Linux client.

### Wasabi

When I first saw Wasabi mentioned online I misunderstood what they are.  Wasabi is a cloud object store that is 100% compatible with S3.