The source bootstrap has three compilation stages:

  bin/ay            pg83/ay, built with Go and generated Go scanners
  bin/ya/bootstrap  ay builds yatool's ymake and ya-bin
  bin/ya            the bootstrap ya builds the complete tool set

bin/ya/unwrap contains ya-bin, ymake, ya-tc, test_tool and yexport.
bin/ya/tools/wrapper supplies the ya entry point for both yatool stages.
It selects the installed ymake and compiler and disables downloaded ya tools.

Both yatool stages use the same pinned source archive and shared recipe in t/.
Clang comes from ix's current compiler, including its builtin headers. The
sanitizer interface headers use the clang20-rt directory actually vendored in
this yatool revision, independently of the compiler version.
The final stage also fixes a missing template argument list in the EDL
exporter and redundant template keywords in YT, as required by Clang 23.
It runs with -k to report independent build errors in one pass.

The bootstrap graph uses local resource directories for ix's Clang, Python
and Java. bin/ay's local-resources.patch adds file:// directories: resource
nodes link to immutable store entries instead of downloading binary tools.
The final stage uses ya's system compiler and Python/Java overrides. ANTLR
runs on the real JDK; no generated grammar snapshot or fake Java is needed.

Build the complete chain:
  ./ix build bin/ya

Build either prerequisite independently:
  ./ix build bin/ay
  ./ix build bin/ya/bootstrap

Source revisions and checksums are in bin/ay/ix.sh and bin/ya/t/ix.sh.
There are no yaboot archives, gg dependency, numbered bootstrap revisions,
or extra self-hosting passes.
