
# Path from current directory to top level ableC repository
ABLEC_BASE?=../../../ableC
# Path from current directory to top level extensions directory
EXTS_BASE?=../../../extensions

# The path to the artifact ableC jar.
ABLEC_JAR=../examples/artifact/ableC.jar

# All extended C files to test
XC_FILES=$(wildcard translate_error/*.xc) $(wildcard runtime_error/*.xc) $(wildcard positive/*.xc)
# All extended C files that should translate successfully
TRANS_XC_FILES=$(wildcard runtime_error/*.xc) $(wildcard positive/*.xc)
# All C files that should be generated
C_FILES=$(TRANS_XC_FILES:.xc=.c)
# All object files that should be generated
OBJECTS=$(TRANS_XC_FILES:.xc=.o)
# All executables that should be generated
EXECUTABLES=$(TRANS_XC_FILES:.xc=.out)
# All evaluation marker files that should be generated
TESTS=$(XC_FILES:.xc=.test)

# All directories contining extension header files that may be included
XC_INCLUDE_DIRS=$(wildcard $(EXTS_BASE)/*/include)
# Flags passed to ableC including the appropriate directories
XCFLAGS=$(addprefix -I, $(XC_INCLUDE_DIRS))

# Flags passed to the C compiler, e.g. to enable various compiler extensions
CFLAGS=

# All directories contining extension libraries that may be linked
LIB_DIRS=$(wildcard $(EXTS_BASE)/*/lib)
# Flags passed to the linker specifying the appropriate directories
LDFLAGS=$(addprefix -L, $(LIB_DIRS))
# Flags passed to the linker specifying libraries to link
LDLIBS=
# The static library to link. TODO This one isn't hugely possible to clip out
STATIC_LIBRARY=../lib/libSkeleton.a

all: $(ABLEC_JAR) $(C_FILES) $(OBJECTS) $(EXECUTABLES) $(TESTS)

# This is marked as being phony even though it's a real file so that the
# Makefile in examples always checks for its source files being modified.
.PHONY: $(ABLEC_JAR)
$(ABLEC_JAR):
	@cd ../examples && make ableC.jar

# This is marked as being phony for the same reasons as the above.
.PHONY: $(STATIC_LIBRARY)
$(STATIC_LIBRARY):
	@cd ../lib && make

%.c: %.xc $(ABLEC_JAR)
	java -jar $(ABLEC_JAR) $< $(XCFLAGS)

%.out: %.o $(STATIC_LIBRARY)
	$(CC) $(LDFLAGS) $^ $(LOADLIBES) $(LDLIBS) -o $@

translate_error/%.test: translate_error/%.xc $(ABLEC_JAR)
	@echo "java -jar $(ABLEC_JAR) $< $(XCFLAGS)"
	@if java -jar $(ABLEC_JAR) $< $(XCFLAGS); then exit 1; fi
	touch $@

runtime_error/%.test: runtime_error/%.out
	@echo "./$<"
	@if ./$<; then echo "Failed to error"; exit 2; else echo "(exit $$?)"; fi
	touch $@

%.test: %.out
	./$<
	touch $@

clean:
	rm -f *~ build.xml */*.i */*.c */*.o */*.out */*.test *.jar *.copperdump.html build.xml

.PHONY: all clean
