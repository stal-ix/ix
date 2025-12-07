{% extends '//die/c/ix.sh' %}

{% block git_repo %}
https://github.com/Ekdohibs/camlboot
{% endblock %}

{% block git_commit %}
2692b14a4e685387194556e511fe23057d25c6c3
{% endblock %}

{% block git_sha %}
07bdfa84c354dd68ba863d1958c6169ac4540741f7e36a7bb1af41155010ddc4
{% endblock %}

{% block bld_tool %}
bin/gas
bld/bash
bld/make
bld/guile
bld/prepend
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block build %}
make -j${make_thrs} _boot/ocamlc
{% endblock %}

{% block patch %}
prepend << EOF ocaml-src/configure
#!/bin/sh
set -x
EOF
echo > ocaml-src/byterun/win32.c
sed -e 's|.*section.*rodata.cst8.*progbits.*||' \
    -i ocaml-src/asmrun/amd64.S
{% endblock %}

{% block cpp_defines %}
HAS_GETCWD=1
{% endblock %}

{% block build_flags %}
no_werror
{% endblock %}

{% block c_flags %}
-Wno-incompatible-function-pointer-types
-Wno-ignored-optimization-argument
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp _boot/ocamlc ${out}/bin/
cp _boot/byterun/ocamlrun ${out}/bin/
cp miniml/interp/lex.byte ${out}/bin/ocamllex
cp miniml/interp/makedepend.byte ${out}/bin/ocamldep
chmod +x ${out}/bin/*
{% endblock %}
