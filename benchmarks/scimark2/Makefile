JAVAC=$(JAVA_HOME)/bin/javac

CFLAGS = -O3 -funroll-loops   -Wall -pedantic  -ansi -fPIC -DLIBJNISCIMARK4 -I$(JAVA_HOME)/include -I$(JAVA_HOME)/include/linux

all:
	$(JAVAC) -O commandline.java
	$(JAVAC) -O FFT.java
	$(JAVAC) -O SOR.java
	$(JAVAC) -O kernel.java
	mv *.class jnt/scimark2/

libjnifft-amd64:
	$(JAVAC) -h . FFT.java
	$(CC) $(CFLAGS) -c FFT.c -o FFT.o
	$(CC) $(CFLAGS) -shared -fPIC -o libjnifft-amd64.so FFT.o -ldl -lm

libjnisor-amd64:
	$(JAVAC) -h . SOR.java
	$(CC) $(CFLAGS) -c SOR.c -o SOR.o
	$(CC) $(CFLAGS) -shared -fPIC -o libjnisor-amd64.so SOR.o -ldl -lm

