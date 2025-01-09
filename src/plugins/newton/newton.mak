CC = cl

VLIVDIR = ../..

DEBUG = -O2

CFLAGS = -Wall $(DEBUG) -D_CRT_SECURE_NO_DEPRECATE -DWIN32 -DWINDOWS -I. -I$(VLIVDIR)

SYSLIBS = -lwininet -luser32 -lgdi32 -lkernel32 -lcomctl32 -lcomdlg32 -lshlwapi \
	  -lshell32 -ladvapi32 -lversion

all: newton.dll

newton.o : newton.c newton.h
	$(CC) $(CFLAGS) -c newton.c

newton.dll: newton.o
	$(CC) -shared $@ newton.o

clean:
	rm newton.o newton.dll
