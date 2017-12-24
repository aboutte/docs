#!/bin/bash

set -eu

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BASENAME="$(basename $0)"
timestamp() {
  date +%Y/%m/%d:%H:%M:%S
}
LOG_FILE=$DIR/$BASENAME.log
LOG_FILE_FAILED=$DIR/$BASENAME-failed.log
RIP_QUEUE="/Volumes/media/rip.andyboutte.com/queue"
DVD_DEVICE="$(drutil status | grep "DVD-ROM" | head -1 | awk '{print $4}')"
DVD_NAME="$(diskutil info $DVD_DEVICE | grep "Volume Name:" | awk '{print substr($0, index($0,$3))}')"
FAIRMOUNT_DVD_DEVICE="/Volumes/$DVD_NAME"

exec >> $LOG_FILE
exec 2>&1

trap lock SIGHUP SIGINT SIGTERM EXIT

log() {
	echo "$(timestamp) - $1" >> $LOG_FILE
}

eject_dvd() {
	log "Ejecting DVD..."
	drutil eject
}

lock() {
	# I need to set lock if SIGHUP or SIGINT or SIGTERM are incountered
	# but if I receive an EXIT I need to check exit status to make sure we didnt reach the end successfully
	if [ $? -ne 0 ]
	then
	 	echo "$(timestamp) - DVD_DEVICE = $DVD_DEVICE" >> $LOG_FILE_FAILED
	 	echo "$(timestamp) - DVD_NAME = $DVD_NAME" >> $LOG_FILE_FAILED
	 	echo "$(timestamp) - FAIRMOUNT_DVD_DEVICE = $FAIRMOUNT_DVD_DEVICE" >> $LOG_FILE_FAILED
	fi
}

# if [ -f "/Users/aboutte/.rip_lock" ]; then
# 	log "Lock file found!  Ejecting disc and exiting!"
# 	# TODO: create system alert sound here?
# 	exit 1
# fi

log ""
log ""
log "Starting $BASENAME."

mount_nas() {
	NAS_MOUNT_POINT="/Volumes/media"
	log "Checking if NAS is already mounted..."
	if [ ! -d "$NAS_MOUNT_POINT" ]; then
		log "Mounting NAS..."
		mkdir /Volumes/media
		mount -t afp afp://media:password@synology.andyboutte.com/media $NAS_MOUNT_POINT
		log "NAS mounted successfully."
	else
		log "NAS already mounted."
	fi
}

start_fairmount() {
	log "Checking if fairmount is already started..."
	if [[ ! $(ps axo pid,command | grep "[F]airmount.app") ]]; then
		log "Starting fairmount..."
    	open -a Fairmount
    	sleep 60
    	log "Fairmount startup complete."
	else
		log "Fairmount already started."
	fi
}

stop_fairmount() {
	log "Stopping Fairmount..."
	kill -9 $(ps axo pid,command | grep "[F]airmount.app" | awk '{print $1}')
}

eject_fairmount_dvd() {
	log "Ejecting Fairmount device..."
	diskutil unmount "$FAIRMOUNT_DVD_DEVICE"
}

mount_nas
start_fairmount

mkdir -p "$RIP_QUEUE/$DVD_NAME"
log "Starting transcoding process to $RIP_QUEUE/$DVD_NAME..."
transcode-video "$FAIRMOUNT_DVD_DEVICE" --output "$RIP_QUEUE/$DVD_NAME/$DVD_NAME.mkv"
log "Finished transcoding process."

eject_fairmount_dvd
stop_fairmount
eject_dvd

log "All finished."
log ""
log ""
