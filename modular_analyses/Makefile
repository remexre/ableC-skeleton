
# Path from current directory to top level ableC repository
ABLEC_BASE?=../../../ableC
# Path from current directory to top level extensions directory
EXTS_BASE?=../../../extensions

# All directories containing grammars that may be included
GRAMMAR_DIRS=$(ABLEC_BASE) $(wildcard $(EXTS_BASE)/*/grammars) .
# Flags passed to silver including the appropriate directories
SVFLAGS=$(addprefix -I , $(GRAMMAR_DIRS))

all: mda mwda

mda:
	touch $(wildcard determinism/*.sv)
	silver -o MDA.jar $(SVFLAGS) --clean determinism

mwda:
	touch $(wildcard well_definedness/*.sv)
	silver -o MWDA.jar $(SVFLAGS) --clean --warn-all --warn-error well_definedness

clean:
	rm -f *~ *.jar *.copperdump.html build.xml

.PHONY: all mda mwda clean
