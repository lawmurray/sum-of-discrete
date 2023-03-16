# compile flags
CPPFLAGS=-Wno-macro-redefined
CFLAGS=-Isrc -I/usr/local/cuda/include -O3 -g
NVCCFLAGS=-Isrc -I/usr/local/cuda/include -O3 -g -allow-unsupported-compiler -Xcompiler=-Wall -Xcompiler=-Wno-macro-redefined

# link flags
LDFLAGS=-L/usr/local/cuda/lib64

# build the main program
main: src/main.o src/convolve.o
	nvcc $(NVCCFLAGS) $(LDFLAGS) -o $@ $^

# remove all build artifacts
clean:
	rm -f src/*.o main

# compile each source file, with dependencies
src/main.o: src/main.c src/convolve.h
src/convolve.o: src/convolve.cu src/convolve.h

# pattern rule to compile an object file from a CUDA source file
%.o : %.cu
	nvcc $(NVCCFLAGS) -c -o $@ $<
