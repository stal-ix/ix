#define _XOPEN_SOURCE 500

#include <ftw.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <errno.h>
#include <sys/stat.h>

#include <md5.h>
#include <sha256.h>

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

static int unlink_cb(const char* fpath, const struct stat* sb, int typeflag, struct FTW* ftwbuf) {
    return remove(fpath) && unlink(fpath);
}

static void main_rmrf(int argc, char** argv) {
    if (argc < 2) {
        die(2, EINVAL, "usage: path [prog]+");
    }

    if (nftw(argv[1], unlink_cb, 64, FTW_DEPTH | FTW_PHYS) && errno != ENOENT) {
        die(2, errno, "nftw failed");
    }

    exec(argv + 2);
}

static const char* cknull(const char* sum) {
    if (!sum) {
        die(2, errno, "cksum failed");
    }

    return sum;
}

static inline const char* fix_sum(const char* s) {
    const char* ns = strchr(s, ':');

    return ns ? (ns + 1) : s;
}

static void main_cksum(int argc, char** argv) {
    if (argc < 3) {
        die(2, EINVAL, "usage: checksum path [prog]+");
    }

    const char* sum = fix_sum(argv[1]);
    const char* path = argv[2];

    char buf[1000];

    if (strlen(sum) == 32) {
        if (strcmp(cknull(MD5File(path, buf)), sum)) {
            die(3, EINVAL, buf);
        }
    } else if (strlen(sum) == 64) {
        if (strcmp(cknull(SHA256_File(path, buf)), sum)) {
            die(2, EINVAL, buf);
        }
    } else {
        die(2, EINVAL, "unknown checksum func");
    }

    exec(argv + 3);
}

static void main_link(int argc, char** argv) {
    if (argc < 3) {
        die(2, EINVAL, "usage: checksum path [prog]+");
    }

    if (link(argv[1], argv[2])) {
        die(3, errno, "link failed");
    }

    exec(argv + 3);
}

static void main_fail(int argc, char** argv) {
    exit(1);
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

    if (strcmp(tool, "rmrf") == 0) {
        main_rmrf(argc, argv);
    }

    if (strcmp(tool, "cksum") == 0) {
        main_cksum(argc, argv);
    }

    if (strcmp(tool, "link") == 0) {
        main_link(argc, argv);
    }

    if (strcmp(tool, "fail") == 0) {
        main_fail(argc, argv);
    }

    die(1, EINVAL, "unknown tool");
}
