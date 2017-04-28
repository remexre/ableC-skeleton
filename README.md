## A very simple 'skeleton' extension

This sample extension exemplifies an organization that some might
find useful in writing language extensions for ableC.

The `edu.umn.cs.melt.exts.ableC.skeleton` directory contains all the
Silver source of the langauge extension.

The `artifact` and `examples` directories demonstrate how to create an
ableC compiler using the extension and some sample programs using that
extension.

The `modular_analyses` directory contains a directory for each of the
two modular analyses: modular determinism and modular well-definedness.  
A `run.sh` script is in each to make it easy for an extension user to
verify that the extension does in fact pass the modular analyses.

Extension designers are of course free to organize files as they
choose.  This is simply an example that works well for us.
