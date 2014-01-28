#!/bin/sh
#
# Monitor the signup-queue directory and auto adduser
#
. /lib/libtaz.sh

[ "$root" ] || root="/home/slish/chroot"
cache="$(dirname $root)/cache"
queue="${cache}/signup-queue"

inotifywait -m -e create ${queue} 2>/dev/null | while read line
do
	sleep 4 && slish adduser --queued
done
