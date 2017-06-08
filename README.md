## A very simple 'skeleton' extension

This sample extension exemplifies an organization that some might
find useful in writing language extensions for ableC.

The `grammars` directory contains all the Silver source of the
langauge extension.

The `examples` directory demonstrates how to create an ableC compiler
using the extension and some sample programs using that extension.
This directory contains a `Makefile` that can be used to compile and
run the examples.  

The `modular_analyses` directory contains a directory for each of the
two modular analyses: modular determinism and modular well-definedness.  
A `Makefile` makes it easy for an extension user to verify that the
extension does in fact pass the modular analyses.

The `tests` directory contains some positive and negative tests of
various features of the extension.  

Library headers and source files used by an extension are placed in the
`include` and `lib` directories, respectively.  

At the top level, another `Makefile` is provided to allow examples,
modular analyses, and tests to be easily built.  

Extension designers are of course free to organize files as they
choose.  This is simply an example that works well for us.
