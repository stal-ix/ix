# dep boot/stage/1/heirloom boot/stage/0/env

build() {
    mkdir $out/bin && gcc $CPPFLAGS $CFLAGS $LDFLAGS -o $out/bin/which -x c - << EOF
{% include 'which.c' %}
EOF
}
