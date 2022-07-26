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

static void main_setpwd(int argc, char** argv) {
    if (argc < 2) {
        die(2, EINVAL, "usage: pwd [prog]+");
    }

    if (chdir(argv[1])) {
        die(2, errno, "chdir failed");
    }

    exec(argv + 2);
}

static void main_mkdir(int argc, char** argv) {
    if (argc < 2) {
        die(2, EINVAL, "usage: dir [prog]+");
    }

    if (mkdir(argv[1], 0755)) {
        die(2, errno, "mkdir failed");
    }

    exec(argv + 2);
}

static void main_unlink(int argc, char** argv) {
    if (argc < 2) {
        die(2, EINVAL, "usage: path [prog]+");
    }

    if (unlink(argv[1])) {
        die(2, errno, "unlink failed");
    }

    exec(argv + 2);
}

int main(int argc, char** argv) {
    if (argc < 2) {
        die(1, EINVAL, "usage: liner tool [args]+");
    }

    const char* tool = *++argv;

    --argc;

    if (strcmp(tool, "setpwd") == 0) {
        main_setpwd(argc, argv);
    }

    if (strcmp(tool, "mkdir") == 0) {
        main_mkdir(argc, argv);
    }

    if (strcmp(tool, "unlink") == 0) {
        main_unlink(argc, argv);
    }

    die(1, EINVAL, "unknown tool");
}
