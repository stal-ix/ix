#define _XOPEN_SOURCE 500

#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <errno.h>
#include <sys/stat.h>

static inline void die(int code, int err, const char* msg) {
    fprintf(stderr, "%s: %s\n", strerror(err), msg);
    exit(code);
}

static void exec(char** argv) {
    if (*argv) {
        if (execvp(*argv, argv)) {
            die(3, errno, "exec failed");
        }
    } else {
        exit(0);
    }
}

int main(int argc, char** argv) {
    if (argc < 2) {
        die(2, EINVAL, "usage: setpwd [prog]+");
    }

    if (chdir(argv[1])) {
        die(2, errno, "chdir failed");
    }

    exec(argv + 2);
}
