# dep boot/stage/2/heirloom boot/stage/1/env

build() {
    mkdir $out/bin && gcc -D_BSD_SOURCE $CPPFLAGS $CFLAGS $LDFLAGS -o $out/bin/which -x c - << EOF
{% include 'which.c' %}
EOF
}
