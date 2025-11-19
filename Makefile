COPT		:= -O3 -Wall -Werror
BIN		:= /usr/local/bin
GIT         := /usr/bin/git
VERSION		:= $(shell $(GIT) rev-parse HEAD)
SOURCEFILES	:= dterm.c speeds.sh Makefile LICENCE.txt README.txt
READLINE	:= -DREADLINE -lreadline

dterm:		dterm.c speeds.h
		gcc ${COPT} -o dterm dterm.c -DVERSION='"$(VERSION)"' $(READLINE)

speeds.h:	speeds.sh
		sh speeds.sh >speeds.h

install:
		install dterm ${BIN}

clean:
		rm -f dterm speeds.h *.o *.bak

package:	$(SOURCEFILES)
		mkdir -p dterm-$(VERSION)
		cp $(SOURCEFILES) dterm-$(VERSION)
		tar cfvz dterm-$(VERSION).tgz dterm-$(VERSION)
