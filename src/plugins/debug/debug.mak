CC  = cl

VLIVDIR = ../..

DEBUG = -O2

CFLAGS = -Wall $(DEBUG) -D_CRT_SECURE_NO_DEPRECATE -DWIN32 -DWINDOWS -I. -I$(VLIVDIR)

SYSLIBS = 

all: debug.dll

debug.o : debug.c debug.h
	$(CC) $(CFLAGS) -c debug.c

debug.dll: debug.o
	$(CC) -shared -o $@ debug.o

clean:
	rm debug.o debug.dll
