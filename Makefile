# Makefile of QUALEX-MS solver for GNU make

# Please substitute correct values for LIBS, LAPACKLIB and BLASLIB
# to use it on your environment

CFLAGS = -DNDEBUG -Ofast -funroll-all-loops -Wall
LINKFLAGS = $(LDFLAGS)

LDFLAGS = -L/opt/homebrew/opt/openblas/lib -L/opt/homebrew/opt/lapack/lib -L/opt/homebrew/Cellar/gcc/14.1.0_2/lib/gcc/current
CPPFLAGS = -I/opt/homebrew/opt/openblas/include -I/opt/homebrew/opt/lapack/include


CC = gcc
CXX = g++
LIBS = -lgfortran
LAPACKLIB = -llapack
BLASLIB = -lopenblas

.SUFFIXES: .o .cc .c

OBJS_c = bool_vector.cc graph.cc greedy_clique.cc main.cc preproc_clique.cc qualex.cc refiner.cc eigen.c mdv.c
OBJS_o = bool_vector.o graph.o greedy_clique.o main.o preproc_clique.o qualex.o refiner.o eigen.o mdv.o

qualex-ms: $(OBJS_c) $(OBJS_o)
	$(CXX) $(LINKFLAGS) $(CFLAGS) -o $@ $(OBJS_o) $(LAPACKLIB) $(BLASLIB) $(LIBS)

clean:
	rm *.o qualex-ms

.c.o:
	$(CC) $(CFLAGS) -c $<

.cc.o:
	$(CXX) $(CFLAGS) -c $<
