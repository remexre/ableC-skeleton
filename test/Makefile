
EXT_HOME=../../..

ABLEC_JAR=ableC.jar
ARTIFACT=artifact
GRAMMAR_DIRS=$(wildcard $(EXT_HOME)/extensions/*/grammars) $(EXT_HOME)/ableC
GRAMMAR_SOURCES=$(shell find $(GRAMMAR_DIRS) -name *.sv -print0 | xargs -0)
SVFLAGS=$(addprefix -I , $(GRAMMAR_DIRS))

XC_FILES=$(wildcard translate_error/*.xc) $(wildcard runtime_error/*.xc) $(wildcard positive/*.xc)
TRANS_XC_FILES=$(wildcard runtime_error/*.xc) $(wildcard positive/*.xc)
C_FILES=$(TRANS_XC_FILES:.xc=.c)
OBJECTS=$(TRANS_XC_FILES:.xc=.o)
EXECUTABLES=$(TRANS_XC_FILES:.xc=.out)
TESTS=$(XC_FILES:.xc=.test)

XC_INCLUDE_DIRS=$(wildcard $(EXT_HOME)/extensions/*/include)
XCFLAGS=$(addprefix -I, $(XC_INCLUDE_PATH))

LIB_DIRS=$(wildcard $(EXT_HOME)/extensions/*/lib)
LDLIBS=$(addprefix -L, $(LIB_DIRS))

all: $(ABLEC_JAR) $(C_FILES) $(OBJECTS) $(EXECUTABLES) $(TESTS)

$(ABLEC_JAR): $(GRAMMAR_SOURCES)
	touch $(wildcard $(ARTIFACT)/*.sv)
	silver -o $(ABLEC_JAR) $(SVFLAGS) $(ARTIFACT)

%.c: %.xc $(ABLEC_JAR)
	java -jar $(ABLEC_JAR) $< $(XCFLAGS)

%.out: %.o
	$(CC) $(LDFLAGS) $< $(LOADLIBES) $(LDLIBS) -o $@

translate_error/%.test: translate_error/%.xc $(ABLEC_JAR)
	@echo "java -jar $(ABLEC_JAR) $< $(XCFLAGS)"
	@if java -jar $(ABLEC_JAR) $< $(XCFLAGS); then exit 1; fi
	touch $@

runtime_error/%.test: runtime_error/%.out
	@echo "./$<"
	@if ./$<; then echo "Failed to error"; exit 2; else echo "(exit $$?)"; fi
	touch $@

%.test: %.out
	@echo "./$<"
	@./$< || echo "(exit $$?)"
	touch $@

clean:
	rm -f *~ build.xml */*.i */*.c */*.o */*.out */*.test *.jar *.copperdump.html build.xml

.PHONY: all clean
