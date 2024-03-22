#include <errno.h>
#include <spawn.h>
#include <stdio.h>
#include <fcntl.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/wait.h>

extern char** environ;
static char* where;

static void onerr(int c, const char* s) {
    perror(s);
    exit(c);
}

static char* concat(const char* s1, const char* s2) {
    char* ret = malloc(strlen(s1) + strlen(s1) + 1);
    sprintf(ret, "%s%s", s1, s2);
    return ret;
}

static char* str(int x) {
    char* ret = malloc(20);
    sprintf(ret, "%d", x);
    return ret;
}

static void write_file(const char* path, const char* data) {
    int fd = open(path, O_WRONLY);

    if (fd < 0) {
        onerr(1, path);
    }

    int len = strlen(data);

    if (write(fd, data, len) != len) {
        onerr(1, path);
    }

    close(fd);
}

static void cleanup() {
    write_file(concat(where, "/cgroup.kill"), "1\n");
}

static void sighndl(int signal) {
    // assume atexit works
    exit(signal);
}

int main(int argc, char** argv) {
    int pid;
    int err;

    if (argc < 2) {
        errno = EINVAL;
        onerr(1, "usage: cg [command]");
    }

    char* mypid = str(getpid());

    where = concat("/sys/fs/cgroup/srv/", mypid);

    system(concat("mkdir -p ", where));

    write_file(concat(where, "/cgroup.procs"), mypid);
    atexit(cleanup);
    signal(SIGINT, sighndl);
    signal(SIGTERM, sighndl);

    if (posix_spawnp(&pid, argv[1], 0, 0, &argv[1], environ)) {
        onerr(3, "posix_spawnp");
    }

    err = 0;

    while (wait(&err) != pid) {
    }

    return err;
}
