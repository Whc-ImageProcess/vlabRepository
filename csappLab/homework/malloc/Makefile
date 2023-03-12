CC = gcc
CFLAGS = -Wall -O2 -DDEBUG_MALLOC

OBJS = mem_alloc.o

all: mem_alloc

mem_alloc: $(OBJS)
	$(CC) $(CFLAGS) -o mem_alloc $(OBJS)

clean: 
	-rm -f $(OBJS) mem_alloc