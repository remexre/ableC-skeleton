# All C files to compile
C_FILES=$(wildcard *.c)
# All object files that should be generated
OBJECTS=$(C_FILES:.c=.o)
# The name of the shared library.
SHARED_LIBRARY=../lib/libSkeleton.so

# Flags passed to the C compiler, e.g. to enable various compiler extensions
CFLAGS=-fpic

# All directories contining extension libraries that may be linked
LIB_DIRS=$(wildcard $(EXTS_BASE)/*/lib)
# Flags passed to the linker specifying the appropriate directories
LDFLAGS=$(addprefix -L, $(LIB_DIRS)) -shared
# Flags passed to the linker specifying libraries to link
LDLIBS=

all: $(SHARED_LIBRARY)

$(SHARED_LIBRARY): $(OBJECTS)
	$(CC) $(LDFLAGS) $^ $(LOADLIBES) $(LDLIBS) -o $@

clean:
	rm -f *~ *.o $(SHARED_LIBRARY)

.PHONY: all clean
