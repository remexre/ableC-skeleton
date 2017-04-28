#!/bin/bash

# turn on verbose option, which echos commands to stdout
# also exit on non-zero return code
set -v -e

# Generate the -I directives to include the parent directories of the
# test, ableC, and extension specification directories.

EXT_HOME=../..          # Top-level of extension repository
HOME=$EXT_HOME/../..    # Directory containing ableC and extensions directories
ABLEC=$HOME/ableC       # ableC repository
EXTS=$HOME/extensions/* # All extension repositories

INCLUDES=($EXT_HOME $ABLEC $EXTS)

# Needed to force a rebuild of *this* grammar, since there may be other
# grammars named modular_analyses:determinism
touch MDA.sv

silver ${INCLUDES[@]/#/-I } -o MDA.jar --clean $@ \
       modular_analyses:determinism

# This script runs Silver on the grammar that performs the modular
# determinism analysis.  A fair amount of information is displayed to
# the screen, so look for the "copper_mda:" task in the output.  There
# should be a line reading "Modular determinism analysis passed." that
# indicates that the analysis was successful.

rm -f build.xml
