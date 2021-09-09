cd $out && $untar $src/bmake* && cd bmake

clang $CPPFLAGS $CFLAGS $LDFLAGS -o tool -x c - << EOF
#include <stdio.h>

int main() {
    char buf[1024];
    ssize_t n;

    while ((n = fread(buf, 1, sizeof(buf), stdin)) > 0) {
        fwrite(buf, 1, n, stdout);
    }
}
EOF

./tool << EOF > config.h
{% include 'config.h' %}
EOF

./tool << EOF > strlcpy.c
EOF

{% if mix.platform.target.os == 'linux' %}
./tool << EOF >> make.h
#undef MAKE_RCSID
#define MAKE_RCSID(x)
#define __COPYRIGHT(x)
EOF

./tool << EOF > strlcpy.c
#include <string.h>
#include <stdlib.h>

size_t strlcpy(char* dst, const char* src, size_t dstsize) {
        return snprintf(dst, dstsize, "%s", src);
}
EOF
{% endif %}

clang \
    -w $CPPFLAGS $CFLAGS $LDFLAGS -I. \
    -DHAVE_CONFIG_H \
    -DMAKE_NATIVE \
    -DUSE_META \
    -DBMAKE_PATH_MAX=1024 \
    -D_PATH_DEFSYSPATH=\"$PWD/mk\" \
    arch.c buf.c compat.c cond.c dir.c enum.c for.c getopt.c \
    hash.c job.c lst.c main.c make.c make_malloc.c meta.c metachar.c \
    parse.c sigcompat.c str.c stresep.c suff.c targ.c trace.c util.c var.c \
    strlcpy.c \
    -o bmake
