# Makefile
# Copyright (C) 2022 Ho-Ren (Jack) Chuang <horenc@vt.edu>
#
CC = $(CROSS_COMPILE)gcc
OBJDUMP = $(CROSS_COMPILE)objdump -d -S

#LIBMIGRATE = libmigrate.a
#POPCORN_LIB_PATH = ../lib
#POPCORN_INC_PATH = ../include

#CFLAGS += -O2
CFLAGS += -O0
CFLAGS += -DDEBUG -g -Wall
#CFLAGS += -DDEBUG -g -Wall -I$(POPCORN_INC_PATH)
#CFLAGS += -DWAIT_FOR_DEBUGGER

#LDFLAGS += -static -L$(POPCORN_LIB_PATH)
LDFLAGS += -static
#LIBS += -pthread -l:$(LIBMIGRATE)
LIBS += -lm

TARGETS = stress50 stress70 stress80 stress100
OBJDUMPS =

all: $(TARGETS) $(OBJDUMPS)

%.o: %.c
	$(CC) -c $(CFLAGS) $^ -o $@

#$(TARGETS): $(TARGETS).o
#	$(CC) $(LDFLAGS) $^ $(LIBS) -o $@

stress50: stress50.o
	$(CC) $(LDFLAGS) $^ $(LIBS) -o $@

stress70: stress70.o
	$(CC) $(LDFLAGS) $^ $(LIBS) -o $@

stress80: stress80.o
	$(CC) $(LDFLAGS) $^ $(LIBS) -o $@

stress100: stress100.o
	$(CC) $(LDFLAGS) $^ $(LIBS) -o $@

clean:
	rm -f $(TARGETS) $(OBJDUMPS) *.o

