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
clear && boldify "Welcome to your SliTaz SHell"
colorize 30 $(date '+%a %b %d %Y - %H:%M')
newline
echo "SliTaz : $(cat /etc/slitaz-release) ($(uname -sr))"
echo "Home   : $(du -sh /home/$USER)"
newline

# Set some env variables
PS1='\u@slish\e[0m:\e[1;34m\w\e[0m\$ '
PATH='/bin:/usr/bin'
HOME=/home/$USER
SHELL=/bin/sh
EDITOR=nano
export PS1 PATH HOME SHELL EDITOR
#umask 0077
umask 0022

# Chroot will drop user into /
cd ${HOME}
exec /bin/sh "$@"

