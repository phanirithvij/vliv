CC  = cl
RC  = rc

#DEBUG = -O0 -g
#LDDEBUG = -g
DEBUG = -O2
VERSION = 2.7
VERSIONSHORT = 270

CFLAGS = -Wall $(DEBUG) -D_CRT_SECURE_NO_DEPRECATE -DWIN32 -DWINDOWS -I.
LDFLAGS = $(LDDEBUG) -mwindows -Wl,--major-image-version,2 -Wl,--minor-image-version,7
# -Wl,--enable-mingw-full32 -Wl,--large-address-aware ????

# strsafe.h is in mingw64 headers
SYSLIBS = -lwininet -luser32 -lgdi32 -lkernel32 -lcomctl32 -lcomdlg32 -lshlwapi \
          -lshell32 -ladvapi32 -lversion -lmsimg32 -lwinmm

OBJECTS = vliv.o urlctrl.o dialogs.o handlers.o bitmap.o recent.o window.o tilemgr.o rawinput.o

all: vliv.exe

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

vliv-res.o: resources/vliv.rc
	$(RC) -i $< -o $@

vliv.exe: $(OBJECTS) vliv-res.o
	$(CC) -o $@ $(OBJECTS) vliv-res.o $(LDFLAGS) $(SYSLIBS)

languages: fra.dll

fra.dll: resources/fra.rc
	$(RC) -i $< -o fra.o
	$(CC) -shared -o $@ fra.o -Wl,--subsystem,windows

clean:
	rm -f *.o *.exe *.dll *.res *~
