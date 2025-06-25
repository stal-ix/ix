all: libdl.a

libdl.a: dlfcn.o Makefile
	-rm -f libdl.a
	ar q libdl.a dlfcn.o

dlfcn.o: dlfcn.cpp dlfcn.h Makefile
	$(CC) -DCOMPILE_DLOPEN -std=c++20 $(CPPFLAGS) $(CFLAGS) $(CXXFLAGS) -c -o dlfcn.o dlfcn.cpp

install: all
	mkdir -p $(PREFIX)/lib
	mkdir -p $(PREFIX)/include
	cp libdl.a $(PREFIX)/lib
	cp dlfcn.h $(PREFIX)/include

test: test.cpp libdl.a Makefile
	$(CC) -std=c++20 $(CPPFLAGS) $(CFLAGS) $(CXXFLAGS) $(LDFLAGS) ./libdl.a ./test.cpp ./libdl.a -o test
	DL_STUB_DEBUG=1 ./test
