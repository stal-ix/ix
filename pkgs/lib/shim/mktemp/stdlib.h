#pragma once

/*
 * <stdlib.h> for a sandbox whose libc has no temporary files: the libc's
 * header as it is, and a mktemp that makes no name.
 */

#include_next <stdlib.h>

static inline char *mktemp(char *name) {
    if (name) {
        *name = 0;
    }

    return name;
}
