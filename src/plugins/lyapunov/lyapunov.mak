CC  = cl

VLIVDIR = ../..

DEBUG = -O2

CFLAGS = -Wall $(DEBUG) -D_CRT_SECURE_NO_DEPRECATE -DWIN32 -DWINDOWS -I. -I$(VLIVDIR)

SYSLIBS = -lwininet -luser32 -lgdi32 -lkernel32 -lcomctl32 -lcomdlg32 -lshlwapi \
	  -lshell32 -ladvapi32 -lversion

all: lyapunov.dll

lyapunov.o : lyapunov.c lyapunov.h
	$(CC) $(CFLAGS) -c lyapunov.c

lyapunov.dll: lyapunov.o
	$(CC) -o $@ lyapunov.o

clean:
	rm lyapunov.o lyapunov.dll
