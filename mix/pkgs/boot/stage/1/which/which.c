#include <string.h>
#include <stdlib.h>
#include <stdio.h>

// memory leaks here, but who care?
int main(int argc, char** argv) {
    char* token = 0;
    char* string = 0;
    char* buf = 0;

    if (argc < 2) {
        return 0;
    }

    string = getenv("PATH");

    if (!string) {
        return 1;
    }

    string = strdup(string);

    if (!string) {
        abort();
    }

    while ((token = strsep(&string, ":")) != NULL) {
        buf = realloc(buf, strlen(token) + strlen(argv[1]) + 100);

        if (!buf) {
            abort();
        }

        sprintf(buf, "%s/%s", token, argv[1]);

        if (fopen(buf, "r")) {
            printf("%s\n", buf);

            return 0;
        }
    }

    return 1;
}
