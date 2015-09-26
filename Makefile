VERSION = v$(shell git describe --dirty 2>/dev/null || echo 1.04)
CPPFLAGS += -DVERSION=\"$(VERSION)\"

PROGS = bin2ecm bin2iso bincomp brrrip byteshuf byteswap cdpatch	\
        fakecrc hax65816 id3point pecompat rels screamf subfile uips	\
        usfv vb2rip wordadd zerofill

.PHONY: all clean install
.SUFFIXES: .txt .1

all: $(PROGS)

clean:
	rm -f $(PROGS) *.1

.txt.1:
	a2x -f manpage $*.txt

prefix?=/usr/local
bindir?=/bin
mandir?=/share/man
target=$(DESTDIR)$(prefix)

install-%: % %.1
	install -d "$(target)$(bindir)"
	install -d "$(target)$(mandir)/man1"
	install $< "$(target)$(bindir)"
	install -m644 $<.1 "$(target)$(mandir)/man1"

install-bin2ecm: bin2ecm bin2ecm.1
	install -d "$(target)$(bindir)"
	install -d "$(target)$(mandir)/man1"
	install bin2ecm "$(target)$(bindir)"
	install -m644 bin2ecm.1 "$(target)$(mandir)/man1"
	ln -s bin2ecm "$(target)$(bindir)/ecm2bin"

install: install-bin2ecm install-bin2iso install-bincomp		\
         install-brrrip install-byteshuf install-byteswap		\
         install-cdpatch install-fakecrc install-hax65816		\
         install-id3point install-pecompat install-rels			\
         install-screamf install-subfile install-uips install-usfv	\
         install-vb2rip install-wordadd install-zerofill
