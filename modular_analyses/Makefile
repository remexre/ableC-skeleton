
EXT_HOME=../../..
GRAMMAR_DIRS=$(wildcard $(EXT_HOME)/extensions/*/grammars) $(EXT_HOME)/ableC
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
