#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int main() {
    size_t n = 10000;
    char* l = malloc(n);
    int show = 1;

    while (getline(&l, &n, stdin) != -1) {
        if (strstr(l, "tkinter")) {
            show = 0;
        }

        if (strstr(l, "binasc")) {
            show = 1;
        }

        if (*l == 0) {
            continue;
        }

        if (l[0] != '#') {
            printf("%s", l);

            continue;
        }

        if (l[1] == ' ') {
            continue;
        }

        if (strstr(l, "SSL")) {
            continue;
        }

        if (strstr(l, "#*")) {
            continue;
        }

        if (strchr(l, '\\')) {
            continue;
        }

        if (show) {
            printf("%s", l + 1);
        }

        *l = 0;
    }
}
