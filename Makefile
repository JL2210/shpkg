PREFIX=/usr
LOCALSTATEDIR=/var
SYSCONFDIR=/etc
VERSION=0.1.0

all: shpkg

const:
	@echo PREFIX=$(PREFIX)
	@echo LOCALSTATEDIR=$(LOCALSTATEDIR)
	@echo SYSCONFDIR=$(SYSCONFDIR)
	@echo VERSION=$(VERSION)

shpkg: shpkg.in
	sed \
	    -e "s,@LOCALSTATEDIR@,$(LOCALSTATEDIR),g" \
	    -e "s,@VERSION@,$(VERSION),g" \
	    shpkg.in > shpkg
	chmod a+x shpkg

install:
	install -dm755 $(DESTDIR)$(PREFIX)/bin
	install -m755 shpkg $(DESTDIR)$(PREFIX)/bin/
	install -dm755 $(DESTDIR)$(SYSCONFDIR)/shpkg
	install -dm755 $(DESTDIR)$(LOCALSTATEDIR)/lib/shpkg

clean:
	rm -f shpkg
