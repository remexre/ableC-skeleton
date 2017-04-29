
all: examples

examples:
	cd examples && make -j

analyses: mda mwda

mda:
	cd modular_analyses && make mda

mwda:
	cd modular_analyses && make mda

clean:
	rm -f *~ 
	cd examples && make clean
	cd modular_analyses && make clean

.PHONY: all examples clean
