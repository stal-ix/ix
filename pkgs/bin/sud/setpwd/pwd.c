#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <errno.h>

static inline void die(const char* msg) {
    fprintf(stderr, "error: %s, %s\n", msg, strerror(errno));
    exit(1);
}

int main(int argc, char** argv) {
    if (argc < 3) {
        die("usage: setpwd pwd [prog]+");
    }

    if (chdir(argv[1])) {
        die("chdir failed");
    }

    if (execvp(argv[2], &argv[2])) {
        die("exec failed");
    }
}
