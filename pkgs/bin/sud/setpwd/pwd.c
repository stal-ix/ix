#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <errno.h>

static inline void die(int code, const char* msg) {
    fprintf(stderr, "shit happen: %s, %s\n", msg, strerror(errno));
    exit(code);
}

int main(int argc, char** argv) {
    if (argc < 3) {
        errno = EINVAL;
        die(1, "usage: setpwd pwd [prog]+");
    }

    if (chdir(argv[1])) {
        die(2, "chdir failed");
    }

    if (execvp(argv[2], &argv[2])) {
        die(3, "exec failed");
    }
}
