# only do hid-wiimote-debug.o if CONFIG_DEBUG_FS
obj-m = hid-wiimote.o
hid-wiimote-y := hid-wiimote-core.o hid-wiimote-ext.o hid-wiimote-debug.o

KVERSION = $(shell uname -r)
all:
	make -C /lib/modules/$(KVERSION)/build V=1 M=$(PWD) modules
clean:
	test ! -d /lib/modules/$(KVERSION) || make -C /lib/modules/$(KVERSION)/build V=1 M=$(PWD) clean
