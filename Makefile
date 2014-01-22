# Makefile for SliSH.
#

PREFIX?=/usr
DESTDIR?=

# Install/Uninstall

install:
	install -m 0777 -d $(DESTDIR)$(PREFIX)/share/slish
	install -m 0755 slish $(DESTDIR)$(PREFIX)/bin
	install -m 0755 tools/slish.sh $(DESTDIR)$(PREFIX)/share/slish

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/slish
	rm -rf $(DESTDIR)$(PREFIX)/share/slish
