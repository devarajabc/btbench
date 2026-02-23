JAVAC=$(JAVA_HOME)/bin/javac

CFLAGS = -O2 -funroll-loops -Wall -pedantic -ansi -fPIC -DLIBJNISCIMARK4 -I$(JAVA_HOME)/include -I$(JAVA_HOME)/include/linux

all:
	$(JAVAC) -O commandline.java
	$(JAVAC) -O FFT.java
	$(JAVAC) -O SOR.java
	$(JAVAC) -O MonteCarlo.java
	$(JAVAC) -O SparseCompRow.java
	$(JAVAC) -O LU.java
	$(JAVAC) -O kernel.java
	mv *.class jnt/scimark2/

libjnifft-amd64:
	$(JAVAC) -h . FFT.java
	$(CC) $(CFLAGS) -c FFT.c -o FFT.o
	$(CC) $(CFLAGS) -shared -fPIC -o libjnifft-amd64.so FFT.o -ldl -lm

libjnifft-loongarch64:
	$(JAVAC) -h . FFT.java
	$(CC) $(CFLAGS) -c FFT.c -o FFT.o
	$(CC) $(CFLAGS) -shared -fPIC -o libjnifft-loongarch64.so FFT.o -ldl -lm

libjnifft-aarch64:
	$(JAVAC) -h . FFT.java
	$(CC) $(CFLAGS) -c FFT.c -o FFT.o
	$(CC) $(CFLAGS) -shared -fPIC -o libjnifft-aarch64.so FFT.o -ldl -lm

libjnisor-amd64:
	$(JAVAC) -h . SOR.java
	$(CC) $(CFLAGS) -c SOR.c -o SOR.o
	$(CC) $(CFLAGS) -shared -fPIC -o libjnisor-amd64.so SOR.o -ldl -lm

libjnisor-loongarch64:
	$(JAVAC) -h . SOR.java
	$(CC) $(CFLAGS) -c SOR.c -o SOR.o
	$(CC) $(CFLAGS) -shared -fPIC -o libjnisor-loongarch64.so SOR.o -ldl -lm

libjnisor-aarch64:
	$(JAVAC) -h . SOR.java
	$(CC) $(CFLAGS) -c SOR.c -o SOR.o
	$(CC) $(CFLAGS) -shared -fPIC -o libjnisor-aarch64.so SOR.o -ldl -lm

libjnimontecarlo-amd64:
	$(JAVAC) -h . MonteCarlo.java
	$(CC) $(CFLAGS) -c Random.c -o Random.o
	$(CC) $(CFLAGS) -c MonteCarlo.c -o MonteCarlo.o
	$(CC) $(CFLAGS) -shared -fPIC -o libjnimontecarlo-amd64.so MonteCarlo.o Random.o -ldl -lm

libjnimontecarlo-loongarch64:
	$(JAVAC) -h . MonteCarlo.java
	$(CC) $(CFLAGS) -c Random.c -o Random.o
	$(CC) $(CFLAGS) -c MonteCarlo.c -o MonteCarlo.o
	$(CC) $(CFLAGS) -shared -fPIC -o libjnimontecarlo-loongarch64.so MonteCarlo.o Random.o -ldl -lm

libjnimontecarlo-aarch64:
	$(JAVAC) -h . MonteCarlo.java
	$(CC) $(CFLAGS) -c Random.c -o Random.o
	$(CC) $(CFLAGS) -c MonteCarlo.c -o MonteCarlo.o
	$(CC) $(CFLAGS) -shared -fPIC -o libjnimontecarlo-aarch64.so MonteCarlo.o Random.o -ldl -lm

libjnisparsecomprow-amd64:
	$(JAVAC) -h . SparseCompRow.java
	$(CC) $(CFLAGS) -c SparseCompRow.c -o SparseCompRow.o
	$(CC) $(CFLAGS) -shared -fPIC -o libjnisparsecomprow-amd64.so SparseCompRow.o -ldl -lm

libjnisparsecomprow-loongarch64:
	$(JAVAC) -h . SparseCompRow.java
	$(CC) $(CFLAGS) -c SparseCompRow.c -o SparseCompRow.o
	$(CC) $(CFLAGS) -shared -fPIC -o libjnisparsecomprow-loongarch64.so SparseCompRow.o -ldl -lm

libjnisparsecomprow-aarch64:
	$(JAVAC) -h . SparseCompRow.java
	$(CC) $(CFLAGS) -c SparseCompRow.c -o SparseCompRow.o
	$(CC) $(CFLAGS) -shared -fPIC -o libjnisparsecomprow-aarch64.so SparseCompRow.o -ldl -lm

libjnilu-amd64:
	$(JAVAC) -h . LU.java
	$(CC) $(CFLAGS) -c LU.c -o LU.o
	$(CC) $(CFLAGS) -shared -fPIC -o libjnilu-amd64.so LU.o -ldl -lm

libjnilu-loongarch64:
	$(JAVAC) -h . LU.java
	$(CC) $(CFLAGS) -c LU.c -o LU.o
	$(CC) $(CFLAGS) -shared -fPIC -o libjnilu-loongarch64.so LU.o -ldl -lm

libjnilu-aarch64:
	$(JAVAC) -h . LU.java
	$(CC) $(CFLAGS) -c LU.c -o LU.o
	$(CC) $(CFLAGS) -shared -fPIC -o libjnilu-aarch64.so LU.o -ldl -lm
