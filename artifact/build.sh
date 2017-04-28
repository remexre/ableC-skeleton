#!/bin/bash

# turn on option to exit on non-zero return code.
set -e

# Since this sample artifact directory is just named 'artifact' the script
# for building this one and all others are the same.

# Generate the -I directives to include the parent directories of the
# artifact, ableC, and all extension specification directories.

EXT_HOME=..             # Top-level of extension repository
HOME=$EXT_HOME/../..    # Directory containing ableC and extensions directories
ABLEC=$HOME/ableC       # ableC repository
EXTS=$HOME/extensions/* # All extension repositories

INCLUDES=($EXT_HOME $ABLEC $EXTS)

# Needed to force a rebuild of *this* grammar, since there may be other
# grammars named artifact
touch Artifact.sv

silver ${INCLUDES[@]/#/-I } -o ableC.jar $@ artifact

rm -f build.xml
