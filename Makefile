VERSION = v1.04
CPPFLAGS += -DVERSION=\"$(VERSION)\"

PROGS = bin2ecm bin2iso bincomp brrrip byteshuf byteswap cdpatch	\
        fakecrc hax65816 id3point pecompat rels screamf subfile uips	\
        usfv vb2rip wordadd zerofill

.PHONY: all clean install

all: $(PROGS)

clean:
	rm -f $(PROGS)

prefix?=/usr/local
bindir?=/bin
target=$(DESTDIR)$(prefix)

install-%: %
	install -d "$(target)$(bindir)"
	install $< "$(target)$(bindir)"

install-bin2ecm: bin2ecm
	install -d "$(target)$(bindir)"
	install bin2ecm "$(target)$(bindir)"
	ln -s bin2ecm "$(target)$(bindir)/ecm2bin"

install: install-bin2ecm install-bin2iso install-bincomp		\
         install-brrrip install-byteshuf install-byteswap		\
         install-cdpatch install-fakecrc install-hax65816		\
         install-id3point install-pecompat install-rels			\
         install-screamf install-subfile install-uips install-usfv	\
         install-vb2rip install-wordadd install-zerofill
