#!/bin/sh
#
# SliSH users SHell - This tool is executed when a user is chrooted and
# must be installed into the SliSH chroot.
#
# Copyright (C) 2014 SliTaz GNU/Linux - BSD License
# Author: Christophe Lincoln <pankso@slitaz.org>
#
. /lib/libtaz.sh

# Welcome
clear && colorize 36 "Welcome to your SliTaz SHell"
boldify $(date '+%a %b %d %Y - %H:%M')
newline

# Set some env variables
PS1='\u@slish\e[0m:\e[1;34m\w\e[0m\$ '
PATH='/bin:/usr/bin'
HOME=/home/$USER
SHELL=/bin/sh
export PS1 PATH HOME SHELL
umask 0077

# Chroot will drop user into /
cd ${HOME}
exec /bin/sh "$@"

