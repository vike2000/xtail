# $Id: Makefile.in,v 2.11 2000/06/04 19:04:56 chip Exp $
# $Source: /local/src/xtail/RCS/Makefile.in,v $

SHELL = /bin/sh

srcdir = .

prefix = /usr/local
exec_prefix = ${prefix}
bindir = ${exec_prefix}/bin
mandir = ${prefix}/share/man

INSTALL = /opt/local/bin/ginstall -c
INSTALL_PROGRAM = ${INSTALL}
INSTALL_DATA = ${INSTALL} -m 644

CC = gcc
DEFS = -DHAVE_CONFIG_H -I$(srcdir) 
CPPFLAGS = 
LDFLAGS = 
LIBS = 
LDFLAGS = 
CFLAGS = -Wall -g -O2 $(DEFS)

TARBALL = xtail.tar
XTAIL_OBJECTS = xtail.o entryfuncs.o miscfuncs.o
DISTFILES = Makefile.in README acconfig.h config.h.in configure \
	configure.in entryfuncs.c install-sh miscfuncs.c xtail.1 xtail.c \
	xtail.h

###

all : xtail xtail.1

xtail : $(XTAIL_OBJECTS)
	$(CC) -o $@ $(LDFLAGS) $(XTAIL_OBJECTS) $(LIBS)

xtail.o : xtail.c xtail.h config.h
entryfuncs.o : entryfuncs.c xtail.h config.h
miscfuncs.o : miscfuncs.c xtail.h config.h

install : $(bindir)/xtail $(mandir)/man1/xtail.1

$(bindir)/xtail : xtail
	$(INSTALL_PROGRAM) $? $@

$(mandir)/man1/xtail.1 : xtail.1
	$(INSTALL_DATA) $? $@

clean :
	rm -f xtail $(XTAIL_OBJECTS) $(TARBALL)

distclean : clean
	rm -f Makefile config.h config.cache config.log config.status

dist : $(TARBALL)

$(TARBALL) : $(DISTFILES)
	tar cf $@ $(DISTFILES)


###

config.status : $(srcdir)/configure
	$(SHELL) ./config.status --recheck

Makefile : $(srcdir)/Makefile.in  config.status
	CONFIG_FILES=$@ CONFIG_HEADERS= $(SHELL) ./config.status

#config.h : $(srcdir)/config.h.in  config.status
#	CONFIG_FILES= CONFIG_HEADERS=$@ $(SHELL) ./config.status

$(srcdir)/configure : $(srcdir)/configure.in
	cd $(srcdir) && autoconf

$(srcdir)/config.h.in : $(srcdir)/configure.in $(srcdir)/acconfig.h
	cd $(srcdir) && autoheader

