#!/bin/bash

# turn on option to exit on non-zero return code.
set -e
# turn on verbose option, which echos commands to stdout
set -v

# cd to the top of the grammars directory
cd ../edu.umn.cs.melt.exts.ableC.skeleton

#
# Build: building the artifact
#
cd artifact
pwd
./build.sh --clean
cd ../

#
# MDA: run modular determinsim analysis
#
cd modular_analyses/determinism
pwd
./run.sh --clean
cd ../../

#
# MWDA: run modular well-definedess analysis
#
cd modular_analyses/well_definedness
pwd
./run.sh --clean
cd ../../

# positive tests
cd ../test/positive
pwd
./the_tests.sh
cd ../../

# negative tests
# there are not negative tests for skeleton, so we skip the following steps.
#  cd test/negative
#  pwd
#  ./the_tests.sh
#  cd ../../

pwd

set +v
