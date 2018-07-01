CC      = gcc
LDFLAGS = -lm -pthread
override CFLAGS += -O3 -Wall -fwrapv -march=native

.PHONY : all clean

all: find_quadhuts find_compactbiomes multifinder clean

multifinder: multifinder.o layers.o generator.o finders.o
	$(CC) -o $@ $^ $(LDFLAGS)

multifinder.o: multifinder.c
	$(CC) -c $(CFLAGS) $<

find_compactbiomes: find_compactbiomes.o layers.o generator.o finders.o
	$(CC) -o $@ $^ $(LDFLAGS)

find_compactbiomes.o: find_compactbiomes.c
	$(CC) -c $(CFLAGS) $<

find_quadhuts: find_quadhuts.o layers.o generator.o finders.o 
	$(CC) -o $@ $^ $(LDFLAGS)

find_quadhuts.o: find_quadhuts.c
	$(CC) -c $(CFLAGS) $<


xmapview.o: xmapview.c xmapview.h
	$(CC) -c $(CFLAGS) $<

finders.o: finders.c finders.h
	$(CC) -c $(CFLAGS) $<

generator.o: generator.c generator.h
	$(CC) -c $(CFLAGS) $<

layers.o: layers.c layers.h
	$(CC) -c $(CFLAGS) $<


clean:
	rm *.o

