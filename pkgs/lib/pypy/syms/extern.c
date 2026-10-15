/* The accessors rffi.CExternVariable() generates on the fly.

   Those are not files in the pypy tree: rffi emits the C text into an
   eci's separate_module_sources, so there is nothing to compile from
   the source tree. Untranslated code still calls them -- every rffi
   wrapper that saves errno does, on every single call -- so they have
   to exist here, spelled exactly as CExternVariable spells them:
   get_<name> and set_<name>. */

#include <errno.h>
#include <stdio.h>

extern char **environ;

int get_errno(void) { return errno; }
void set_errno(int v) { errno = v; }

char **get_environ(void) { return environ; }
void set_environ(char **v) { environ = v; }

FILE *get_stdin(void) { return stdin; }
FILE *get_stdout(void) { return stdout; }
FILE *get_stderr(void) { return stderr; }
