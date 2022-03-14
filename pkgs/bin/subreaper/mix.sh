{% extends '//mix/c_std.sh' %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block step_unpack %}
:
{% endblock %}

{% block build %}
cat << EOF > main.c
#include <errno.h>
#include <spawn.h>
#include <stdio.h>
#include <stdlib.h>

#include <sys/wait.h>
#include <sys/prctl.h>

extern char** environ;

static void onerr(int c, const char* s) {
    perror(s);
    exit(c);
}

int main(int argc, char** argv) {
    int pid;
    int err;

    if (argc < 2) {
        errno = EINVAL;
        onerr(1, "usage: subreaper [command]");
    }

    if (prctl(PR_SET_CHILD_SUBREAPER, 1)) {
        onerr(1, "prctl");
    }

    if (posix_spawnp(&pid, argv[1], 0, 0, &argv[1], environ)) {
        onerr(1, "posix_spawnp");
    }

    err = 0;

    while (wait(&err) != pid) {
    }

    return err;
}
EOF

cc -o subreaper main.c
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp subreaper ${out}/bin/
{% endblock %}
