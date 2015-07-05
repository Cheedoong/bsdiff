ALL : bsdiff bspatch

CFLAGS+= -DBSDIFF_EXECUTABLE -DBSPATCH_EXECUTABLE -O3

bsdiff: blocksort.o bzip2.o bzip2recover.o bzlib.o compress.o crctable.o decompress.o huffman.o randtable.o spewG.o bsdiff.o
	cc $(CFLAGS) blocksort.o bzip2.o bzip2recover.o bzlib.o \
	compress.o crctable.o decompress.o huffman.o \
	randtable.o spewG.o bsdiff.o -o bsdiff

bspatch: blocksort.o bzip2.o bzip2recover.o bzlib.o compress.o crctable.o decompress.o huffman.o randtable.o spewG.o bspatch.o
	cc $(CFLAGS) blocksort.o bzip2.o bzip2recover.o bzlib.o \
	compress.o crctable.o decompress.o huffman.o \
	randtable.o spewG.o bspatch.o -o bspatch

blocksort.o: blocksort.c bzlib_private.h
	cc $(CFLAGS) -c blocksort.c
bzip2.o: bzip2.c bzlib.h
	cc $(CFLAGS) -c bzip2.c
bzip2recover.o: bzip2recover.c bzlib.h
	cc $(CFLAGS) -c bzip2recover.c
bzlib.o: bzlib.c bzlib_private.h
	cc $(CFLAGS) -c bzlib.c
compress.o: compress.c bzlib_private.h
	cc $(CFLAGS) -c compress.c
crctable.o: crctable.c bzlib_private.h
	cc $(CFLAGS) -c crctable.c
decompress.o: decompress.c bzlib_private.h
	cc $(CFLAGS) -c decompress.c
huffman.o: huffman.c bzlib_private.h
	cc $(CFLAGS) -c huffman.c
randtable.o: randtable.c bzlib_private.h
	cc $(CFLAGS) -c randtable.c
spewG.o: spewG.c
	cc $(CFLAGS) -c spewG.c
bsdiff.o: bsdiff.c bsdiff.h
	cc $(CFLAGS) -c bsdiff.c
bspatch.o: bspatch.c bspatch.h
	cc $(CFLAGS) -c bspatch.c

clean :
	rm -rf *.out  *.so *.o bsdiff bspatch
