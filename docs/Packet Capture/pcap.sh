#!/bin/bash

# https://www.linuxquestions.org/questions/linux-networking-3/rotating-capture-files-using-tcpdump-800385/

shopt -s extglob

# variables

CURRENTDATE=''
DDBLOCKSIZE=512
LOGDIR='/var/log/tcpdump'
MAINLOGFILE='main.log'
MAINLOGFILEMAXSIZE=20000000  ## in bytes
OLD=14
QUIT=false
TCPDUMP='/usr/sbin/tcpdump'
TCPDUMPCAPTUREFILEPREFIX='capture-'
TCPDUMPCAPTUREFILESUFFIX=''
TCPDUMPPID=0
TEMPDIR='/var/tmp'

# functions

function log {
	echo "[$(date '+%F %T')] $1" >> "$MAINLOGFILE"
	echo "$1"
}

function checktcpdump {
	[[ $TCPDUMPPID -ne 0 ]] && [[ -e /proc/$TCPDUMPPID ]] && kill -s 0 "$TCPDUMPPID" 2>/dev/null
}

function starttcpdump {
	log "Starting tcpdump..."

	CURRENTDATE=$(date +%F)

	"$TCPDUMP" -w "$LOGDIR/${TCPDUMPCAPTUREFILEPREFIX}${CURRENTDATE}${TCPDUMPCAPTUREFILESUFFIX}.log" &

	if [[ $? -ne 0 ]]; then
		TCPDUMPPID=0
		return 1
	fi

	TCPDUMPPID=$!

	disown "$TCPDUMPPID"

	checktcpdump
}

function starttcpdumploop {
	until starttcpdump; do
		log "Error: Failed to start tcpdump.  Waiting for 20 seconds before next attempt..."
		read -t 20 && QUIT=true
	done
}

function stoptcpdump {
	log "Stopping tcpdump..."
	kill "$TCPDUMPPID"
	checktcpdump && kill -s 9 "$TCPDUMPPID"
	TCPDUMPPID=0
	QUIT=true
}

function restarttcpdump {
	log "Restarting tcpdump..."
	checktcpdump && stoptcpdump
	starttcpdumploop
}

function catchsignals {
	log "Caught a signal..."
	QUIT=true
}

function main {
	local CAPTUREFILEPATTERN FILE MAINLOGFILEMAXBLOCKSIZE NEWDATE SIZE TEMPFILE

	CAPTUREFILEPATTERN="${TCPDUMPCAPTUREFILEPREFIX}[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]${TCPDUMPCAPTUREFILESUFFIX}.log"
	[[ $MAINLOGFILE != */* ]] && MAINLOGFILE=$LOGDIR/$MAINLOGFILE
	(( MAINLOGFILEMAXBLOCKSIZE = (MAINLOGFILEMAXSIZE / DDBLOCKSIZE) + ((MAINLOGFILEMAXSIZE % DDBLOCKSIZE) ? 0 : 1) ))

	log "Starting tcpdump manager script..."

	trap catchsignals SIGQUIT SIGINT SIGKILL SIGTERM

	mkdir -p "$LOGDIR"

	starttcpdumploop

	for (( I = 1;; I = (I + 1) % 20 )); do
		read -t 1 && break  ## we have to separate this from the next statement to ensure proper handling of signals

		[[ $QUIT = true ]] && break

		if [[ I -eq 0 ]]; then
			NEWDATE=$(date +%F)

			if [[ ! $NEWDATE = "$CURRENTDATE" ]]; then
				log "A new day has come."

				if read FILE; then
					log "Deleting $OLD-days old files..."

					while
						log "Deleting $FILE..."

						rm -f "$FILE"

						read FILE
					do
						continue
					done
				fi < <(exec find "$LOGDIR" -name "$CAPTUREFILEPATTERN" -daystart -ctime "+$OLD")   # or -mtime?

				restarttcpdump
			fi
		elif [[ I -eq 1 ]]; then
			SIZE=$(stat --printf=%s "$MAINLOGFILE")

			if [[ $SIZE == +([[:digit:]]) && $(( SIZE / DDBLOCKSIZE )) -gt MAINLOGFILEMAXBLOCKSIZE ]]; then
				echo "Reducing log data in $MAINLOGFILE..."

				TEMPFILE=$TEMPDIR/tcpdump-$RANDOM.tmp

				dd "bs=$DDBLOCKSIZE" "count=$MAINLOGFILEMAXBLOCKSIZE" "if=$MAINLOGFILE" "of=$TEMPFILE"

				cat "$TEMPFILE" > "$MAINLOGFILE"; rm -f "$TEMPFILE"  ## better than mv
			fi
		fi
	done

	checktcpdump && stoptcpdump

	log "Ending tcpdump manager script."
}

# start

main