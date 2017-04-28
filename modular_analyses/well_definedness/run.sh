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
# grammars named modular_analyses:well_definedness
touch MWDA.sv

silver ${INCLUDES[@]/#/-I } -o MDWA.jar --clean --warn-all $@ \
       modular_analyses:well_definedness

# This script runs Silver on the grammar that performs the modular
# well-definedness.  Note the use of the --warn-all flag.

# A fair amount of information is displayed to the screen, so look for
# errors after the "Checking for Errors." line.

