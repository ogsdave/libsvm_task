CXX = mpic++
CFLAGS = -Wall -Wconversion -O3 -std=c++11
SHVER = 2
OS = $(shell uname)

all: svm-train-mpi

svm-train-mpi: svm-train-mpi.cpp svm_par.o
	$(CXX) $(CFLAGS) svm-train-mpi.cpp svm_par.o -o svm-train-mpi -lm
svm_par.o: svm_par.cpp svm.h ThreadPool/SvmThreads.h ThreadPool/ThreadPool.h ThreadPool/CachePool.h
	$(CXX) $(CFLAGS) -c svm_par.cpp
clean:
	rm -f *~ svm_par.o svm-train-mpi
