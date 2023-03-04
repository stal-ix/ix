#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>

static void onerr(int c, const char* s) {
    write(2, s, strlen(s));
    exit(c);
}

static int isExFile(const char* path) {
    struct stat sb;

    return (stat(path, &sb) == 0) && S_ISREG(sb.st_mode) && (sb.st_mode & 0111);
}

static char* cat(const char* a, const char* b) {
    char* res = malloc(strlen(a) + strlen(b) + 1);
    *res = 0;
    return strcat(strcat(res, a), b);
}

static char* cat3(const char* a, const char* b, const char* c) {
    return cat(cat(a, b), c);
}

static void lookupError(int code, const char* tool) {
    onerr(code, cat3("can not find \"", tool, "\" tool\n"));
}

static const char* findTool(char* where, const char* tn) {
    char* cur;

    if (strlen(where) < 2) {
        lookupError(1, tn);
    }

    cur = cat3(where, "/", tn);

    if (isExFile(cur)) {
        return cur;
    }

    char* slash = strrchr(where, '/');

    if (!slash) {
        lookupError(1, tn);
    }

    *slash = 0;

    return findTool(where, tn);
}

int main(int argc, char** argv) {
    return execvp(findTool(get_current_dir_name(), "ix"), argv);
}
