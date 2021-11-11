{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://common-lisp.net/project/ecl/static/files/release/ecl-21.2.1.tgz
0c9e0437dbf3a7f1b00da32b7794a3b0
{% endblock %}

{% block bld_deps %}
lib/boehmgc/mix.sh
lib/gmp/mix.sh
lib/ffi/mix.sh
{{super()}}
{% endblock %}

{% block unpack %}
{{super()}}
mkdir build && cd build
{% endblock %}

{% block configure %}
dash ../src/configure ${COFLAGS} \
    --enable-threads=yes \
    --enable-libatomic=system \
    --enable-gmp=system \
    --enable-boehm=yes \
    --disable-shared \
    --enable-static \
    --prefix=${out} \
    --srcdir="${PWD}/../src"
{% endblock %}
