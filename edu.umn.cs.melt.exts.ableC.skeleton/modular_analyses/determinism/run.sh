#!/bin/bash

# turn on verbose option, which echos commands to stdout
# also exit on non-zero return code
set -v -e

# Generate the -I directives to include the parent directories of the
# ableC and extension specification directories.

HOME=../../../../..
ABLEC=$HOME/ableC
EXTS=$HOME/extensions/* # Include all extensions in search path

INCLUDES=($ABLEC $EXTS)

silver ${INCLUDES[@]/#/-I } -o MDA.jar --clean $@ \
       edu:umn:cs:melt:exts:ableC:skeleton:modular_analyses:determinism

# This script runs Silver on the grammar that performs the modular
# determinism analysis.  A fair amount of information is displayed to
# the screen, so look for the "copper_mda:" task in the output.  There
# should be a line reading "Modular determinism analysis passed." that
# indicates that the analysis was successful.

rm -f build.xml
