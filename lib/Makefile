
# All C files to compile
C_FILES=$(wildcard *.c)
# All object files that should be generated
OBJECTS=$(C_FILES:.c=.o)
# The name of the shared library.
SHARED_LIBRARY=libSkeleton.so
# The name of the static library.
STATIC_LIBRARY=libSkeleton.a

# Flags passed to the C compiler, e.g. to enable various compiler extensions
CFLAGS=-fpic

# All directories contining extension libraries that may be linked
LIB_DIRS=$(wildcard $(EXTS_BASE)/*/lib)
# Flags passed to the linker specifying the appropriate directories
LDFLAGS=$(addprefix -L, $(LIB_DIRS))
# Flags passed to the linker specifying libraries to link
LDLIBS=

all: $(SHARED_LIBRARY) $(STATIC_LIBRARY)

$(SHARED_LIBRARY): $(OBJECTS)
	$(CC) -shared $(LDFLAGS) $^ $(LOADLIBES) $(LDLIBS) -o $@

$(STATIC_LIBRARY): $(OBJECTS)
	$(AR) rcs $@ $^

clean:
	rm -f *~ *.o $(SHARED_LIBRARY) $(STATIC_LIBRARY)

.PHONY: all clean
