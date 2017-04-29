
EXT_HOME=../../..

ABLEC_JAR=ableC.jar
ARTIFACT=artifact
GRAMMAR_DIRS=$(wildcard $(EXT_HOME)/extensions/*/grammars) $(EXT_HOME)/ableC
GRAMMAR_SOURCES=$(shell find $(GRAMMAR_DIRS) -name *.sv -print0 | xargs -0)
SVFLAGS=$(addprefix -I , $(GRAMMAR_DIRS))

XC_FILES=$(wildcard *.xc)
C_FILES=$(XC_FILES:.xc=.c)
OBJECTS=$(XC_FILES:.xc=.o)
EXECUTABLES=$(XC_FILES:.xc=)
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

%.test: %
	@echo "Running $<..."
	@./$< || echo "(exit $$?)"
	touch $@

clean:
	rm -f *~ build.xml *.i *.c *.o *.test $(EXECUTABLES) *.out *.jar *.copperdump.html build.xml

.PHONY: all clean
