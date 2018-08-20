# Please see LICENSE for licensing information.


# --------- FLAGS AND VARIABLES --------------------

CFLAGS=-m32 -ffreestanding
HEADERPATH=-I./



# ---------  GENERIC MAKE RULES --------------------

all: 
	@echo "Makefile for the liballoc libr$(AR)y."
	@echo "Please see LICENSE for licensing information."
	@echo 
	@echo "Output should be: liballoc.a "
	@echo "                  liballoc.so"
	@echo 
	@echo "Usage: make [ compile | clean | <platform> ] "
	@echo 
	@echo "Currently supported platforms:"
	@echo 
	@echo "      linux"
	@echo "      linux_debug"
	@echo
	@echo
	@echo "Please see the README for example usage"


clean:
	rm -f ./*.o
	rm -f ./*.a
	rm -f ./*.so

compile:	liballoc.a
liballoc.a:	liballoc.c liballoc.h
	$(CC) $(HEADERPATH) $(CFLAGS) -static -c liballoc.c
	$(AR) -rcv liballoc.a  *.o

linux:
	$(CC) $(HEADERPATH) $(CFLAGS) -static -c liballoc.c linux.c
	$(AR) -rcv liballoc.a  *.o
	$(CC) $(HEADERPATH) $(CFLAGS) -shared liballoc.c linux.c -o liballoc.so


linux_debug:
	$(CC) -DDEBUG $(HEADERPATH) $(CFLAGS) -static -c liballoc.c linux.c
	$(AR) -rcv liballoc.a  *.o
	$(CC) -DDEBUG $(HEADERPATH) $(CFLAGS) -shared liballoc.c linux.c -o liballoc.so
