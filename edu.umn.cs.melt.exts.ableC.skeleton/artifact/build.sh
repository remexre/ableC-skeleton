#!/bin/bash

# turn on option to exit on non-zero return code.
set -e

# Generate the -I directives to include the parent directories of the
# ableC and extension specification directories.

HOME=../../../..
ABLEC=$HOME/ableC
EXTS=$HOME/extensions/* # Include all extensions in search path

INCLUDES=($ABLEC $EXTS)

silver ${INCLUDES[@]/#/-I } -o ableC.jar $@ \
  edu:umn:cs:melt:exts:ableC:skeleton:artifact

rm -f build.xml
