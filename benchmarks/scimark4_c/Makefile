.SUFFIXES: .c .o

.c.o:
	$(CC) $(CFLAGS) -c $<

CPU := $(shell uname -m)
JAVAC=$(JAVA_HOME)/bin/javac

CC = cc
LDFLAGS =
CFLAGS = -O2 -funroll-loops -Wall -pedantic -ansi
ifneq ($(JAVA_HOME),)
	CFLAGS = -O2 -funroll-loops -Wall -pedantic -ansi -fPIC -DLIBJNISCIMARK4 -I$(JAVA_HOME)/include -I$(JAVA_HOME)/include/linux
endif

OBJS = FFT.o kernel.o Stopwatch.o Random.o SOR.o SparseCompRow.o \
	array.o MonteCarlo.o LU.o scimark4.o

ifeq ($(CPU),x86_64)
all: scimark4-x86_64
else ifeq ($(CPU),aarch64)
all: scimark4-aarch64
else
all: scimark4
endif

scimark4-x86_64 :  $(OBJS)
	$(CC) $(CFLAGS) -o scimark4-x86_64  $(OBJS) $(LDFLAGS) -lm

scimark4-aarch64 :  $(OBJS)
	$(CC) $(CFLAGS) -o scimark4-aarch64  $(OBJS) $(LDFLAGS) -lm

libjniscimark4-amd64 :  $(OBJS)
	$(JAVAC) -h . SciMark4J.java
	$(CC) $(CFLAGS) -shared -fPIC -o libjniscimark4-amd64.so $(OBJS) -ldl -lm

libjniscimark4-loongarch64 :  $(OBJS)
	$(JAVAC) -h . SciMark4J.java
	$(CC) $(CFLAGS) -shared -fPIC -o libjniscimark4-loongarch64.so $(OBJS) -ldl -lm

scimark4 :  $(OBJS)
	$(CC) $(CFLAGS) -o scimark4  $(OBJS) $(LDFLAGS) -lm

clean:
	rm -f $(OBJS)

wipe:
	rm -f $(OBJS) scimark4 scimark4-x86_64 scimark4-aarch64
