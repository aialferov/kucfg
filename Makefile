PROJECT = kucfg

DESTDIR =

PREFIX = usr/local
BINDIR = bin

BIN_PATH = $(DESTDIR)/$(PREFIX)/$(BINDIR)

all:
	echo "Usage: make install|uninstall"

installdirs:
	mkdir -p $(BIN_PATH)

install: installdirs
	install src/$(PROJECT) $(BIN_PATH)/$(PROJECT)

uninstall:
	rm -f $(BIN_PATH)/$(PROJECT)
