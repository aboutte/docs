# Duplicacy Notes

wiki - https://github.com/gilbertchen/duplicacy/wiki


## init

1. change directory to the source of the backups

    cd ~/r/
    
2. Register the directory as the duplicacy repository

    duplicacy init -e -pref-dir ~/r/dotfiles/duplicacy/${repo_name} ${repo_name} s3://us-east-1@s3.wasabisys.com/aboutte.backup.boutte/13mbpr01-aboutte


## backup

    cd ~/r/
    duplicacy backup -stats -t initial
    

## list

listing backups can be used to figure which snapshot to restore

    duplicacy list -all
    duplicacy list -id repo
    
## history

find all the revisions where a specific file was backed up

    duplicacy history ~/Desktop/filename    

## restore

use the init command to setup a repository with the same name of a previously backed up repository

    cd ~/Desktop/
    mkdir restore
    cd restore/
    duplicacy init -e ${repo_name} s3://us-east-1@s3.wasabisys.com/aboutte.backup.boutte/13mbpr01-aboutte
    duplicacy list
    # By default duplicacy will restore the entire snapshot.  Filters can be used to exclude everything and just include the required directory/file 
    duplicacy restore -stats -threads 20 -r 177 -- i:rean-platform/.*$  e:.*

## launchd

### repo

#### backup

curl -o ~/Library/LaunchAgents/com.zerowidth.launched.duplicacy.backup.repo.plist http://launched.zerowidth.com/plists/839cd4c0-def3-0135-4bb3-25eaf5b91f13.xml
launchctl load -w ~/Library/LaunchAgents/com.zerowidth.launched.duplicacy.backup.repo.plist

#### prune

### home

#### backup

curl -o ~/Library/LaunchAgents/com.zerowidth.launched.duplicacy.backup.home.plist http://launched.zerowidth.com/plists/97dda290-def3-0135-4bb3-25eaf5b91f13.xml
launchctl load -w ~/Library/LaunchAgents/com.zerowidth.launched.duplicacy.backup.home.plist

#### prune

duplicacy -log prune -keep 1:15      # Keep 1 snapshot every 1 day(s) if older than 15 day(s)    - hourly for 0-15 days
duplicacy -log prune -keep 1:90      # Keep 1 snapshot every 1 day(s) if older than 90 day(s)    - daily for 0-90 days
duplicacy -log prune -keep 30:180    # Keep 1 snapshot every 30 day(s) if older than 180 day(s)  - monthly for 0-360 days
duplicacy -log prune -keep 360:360   # Keep 1 snapshot every 360 day(s) if older than 360 day(s) - yearly forever


## Schedule

https://superuser.com/questions/132084/run-script-when-a-specific-disk-memory-card-is-mounted-under-osx