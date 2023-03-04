#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>

static void onerr(int c, const char* s) {
    perror(s);
    exit(c);
}

static int isExFile(const char* path) {
    struct stat sb;

    return (stat(path, &sb) == 0) && S_ISREG(sb.st_mode) && (sb.st_mode & 0111);
}

static char* cat(const char* a, const char* b) {
    char* res = malloc(strlen(a) + strlen(b) + 1);
    sprintf(res, "%s%s", a, b);
    return res;
}

static char* cat3(const char* a, const char* b, const char* c) {
    return cat(cat(a, b), c);
}

static const char* findTool(char* where, const char* tn) {
    char* cur;

    if (strlen(where) < 2) {
        onerr(1, cat("can not find ", tn));
    }

    cur = cat3(where, "/", tn);

    if (isExFile(cur)) {
        return cur;
    }

    char* slash = strrchr(where, '/');

    if (!slash) {
        onerr(2, cat("can not find ", tn));
    }

    *slash = 0;

    return findTool(where, tn);
}

int main(int argc, char** argv) {
    return execvp(findTool(get_current_dir_name(), "ix"), argv);
}
