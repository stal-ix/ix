{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/ocaml/ocaml/archive/refs/tags/4.07.1.tar.gz
83683ddad54bd23773591a9f757e702fa5cfa2ea1b124d8fe75a73729e592bfe
{% endblock %}

{% block bld_tool %}
bin/gas
bld/bash
{% endblock %}

{% block bld_libs %}
lib/c
lib/build/muldefs
{% endblock %}

{% block configure %}
bash ./configure -prefix ${out}
{% endblock %}

{% block make_target %}
world
{% endblock %}

{% block patch %}
echo > byterun/win32.c
sed -e 's|.*section.*rodata.cst8.*progbits.*||' \
    -i asmrun/amd64.S
rm boot/*
{% endblock %}

{% block cpp_defines %}
HAS_GETCWD=1
HAS_SYMLINK=1
HAS_SOCKETS=1
HAS_INET_ATON=1
{% endblock %}

{% block build_flags %}
wrap_cc
no_werror
{% endblock %}

{% block c_flags %}
-Wno-incompatible-function-pointer-types
-Wno-ignored-optimization-argument
{% endblock %}
