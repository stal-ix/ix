#include <stdio.h>
#include <stdlib.h>

static int decode1(const char* s) {
    if (!*s) {
        abort();
    }

    if (*s >= '0' && *s <= '9') {
        return *s - '0';
    }

    if (*s >= 'a' && *s <= 'f') {
        return 10 + (*s - 'a');
    }

    if (*s >= 'A' && *s <= 'F') {
        return 10 + (*s - 'A');
    }

    abort();
}

static void out(unsigned char c) {
    fwrite(&c, 1, 1, stdout);
}

static void decode(const char* s) {
    for (; *s; ++s) {
        if (*s == '%') {
            int x1 = decode1(++s);
            int x2 = decode1(++s);

            out((unsigned)(x1 * 16 + x2));
        } else {
            out(*s);
        }
    }
}

int main(int argc, char** argv) {
    for (++argv; *argv; ++argv) {
        decode(*argv);
        out('\n');
    }

    return 0;
}
