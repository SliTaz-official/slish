#!/bin/sh
#
# Monitor SliSH home with inotifywait, alert user and delete last file.
#
. /lib/libtaz.sh

[ "$root" ] || root="/home/slish/chroot"
home="${root}/home"
people="$(dirname $root)/people"
logs="$(dirname $root)/logs"
activity="$logs/activity.log"

#trap "killall inotifywait" EXIT
debug "Monitoring: $home"

inotifywait -m -r \
	-e modify -e create ${home} 2>/dev/null | while read path event file
do
	user=$(echo $path | sed s"#${home}/##" | cut -d "/" -f 1)
    size=$(du -sm ${home} | awk '{print $1}')
    tty="$(who | grep ^${user} | awk '{print $2}')"
    . ${people}/${user}/account.conf
    QUOTA="20"
    if [ "$size" -gt "$QUOTA" ]; then
		activity="$logs/alert.log"
		debug "Quota exceeded for: $user"
		log "Quota exceeded for: $user"
		echo "$(colorize 31 ALERT:) quota exceeded" > /dev/${tty}
		debug "Removing: ${path}${file}"
		rm -rf ${path}${file}
    fi
done
