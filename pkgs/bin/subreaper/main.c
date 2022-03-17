#include <errno.h>
#include <spawn.h>
#include <stdio.h>
#include <stdlib.h>

#include <sys/wait.h>
#include <sys/prctl.h>

extern char** environ;

static void onerr(int c, const char* s) {
    perror(s);
    exit(c);
}

int main(int argc, char** argv) {
    int pid;
    int err;

    if (argc < 2) {
        errno = EINVAL;
        onerr(1, "usage: subreaper [command]");
    }

    if (prctl(PR_SET_CHILD_SUBREAPER, 1)) {
        onerr(2, "prctl");
    }

    if (posix_spawnp(&pid, argv[1], 0, 0, &argv[1], environ)) {
        onerr(3, "posix_spawnp");
    }

    err = 0;

    while (wait(&err) != pid) {
    }

    return err;
}
