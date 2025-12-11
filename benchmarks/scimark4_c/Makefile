.SUFFIXES: .c .o

.c.o:
	$(CC) $(CFLAGS) -c $<

CPU := $(shell uname -p)
JAVAC=$(JAVA_HOME)/bin/javac

ifeq ($(CPU),x86_64)
all: scimark4-x86_64
else
all: scimark4
endif


CC = icc
CFLAGS = -O3 -fno-alias -parallel -par-num-threads=4


CC = gcc
CC = cc
LDFLAGS = 
CFLAGS = -O3 -funroll-all-loops -mtune=prescott
CFLAGS = -O3 -funroll-all-loops   -Wall -pedantic -flto
CFLAGS = -O3 -funroll-all-loops   -Wall -pedantic -flto 
CFLAGS = -O3 -funroll-loops   -Wall -pedantic -flto 
CFLAGS = -O3 -funroll-all-loops   -Wall -pedantic  -ansi
CFLAGS = -O3 -funroll-loops   -Wall -pedantic  -ansi
ifneq ($(JAVA_HOME),)
	CFLAGS = -O3 -funroll-loops   -Wall -pedantic  -ansi -fPIC -DLIBJNISCIMARK4 -I$(JAVA_HOME)/include -I$(JAVA_HOME)/include/linux
endif

OBJS = FFT.o kernel.o Stopwatch.o Random.o SOR.o SparseCompRow.o \
	array.o MonteCarlo.o LU.o scimark4.o

scimark4-x86_64 :  $(OBJS)
	$(CC) $(CFLAGS) -o scimark4-x86_64  $(OBJS) $(LDFLAGS) -lm

libjniscimark4-amd64 :  $(OBJS)
	$(JAVAC) -h . SciMark4J.java
	$(CC) $(CFLAGS) -shared -fPIC -o libjniscimark4-amd64.so $(OBJS) -ldl -lm

libjniscimark4-loongarch64 :  $(OBJS)
	$(JAVAC) -h . SciMark4J.java
	$(CC) $(CFLAGS) -shared -fPIC -o libjniscimark4-loongarch64.so $(OBJS) -ldl -lm

scimark4 :  $(OBJS)
	$(CC) $(CFLAGS) -o scimark4  $(OBJS) $(LDFLAGS) -lm 

clean:
	rm $(OBJS) 

wipe:
	rm $(OBJS) scimark4
