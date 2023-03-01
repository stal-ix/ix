#include "xdg_open.h"

#include <spawn.h>

extern char** environ;

int ix_xdg_open(const char* uri) {
    if (!uri) {
        return 0;
    }

    int pid;

    char* args[] = {
        "xdg-open",
        uri,
        0,
    };

    return posix_spawnp(&pid, args[0], 0, 0, args, environ) == 0;
}
