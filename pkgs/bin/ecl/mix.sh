{% extends '//mix/autohell.sh' %}

{% block fetch %}
https://common-lisp.net/project/ecl/static/files/release/ecl-21.2.1.tgz
0c9e0437dbf3a7f1b00da32b7794a3b0
{% endblock %}

{% block bld_libs %}
lib/c
lib/gmp
lib/ffi
lib/boehmgc
{% endblock %}

{% block unpack %}
{{super()}}
mkdir build
cd build
{% endblock %}

{% block configure_script %}
../src/configure
{% endblock %}

{% block configure_flags %}
--enable-threads=yes
--enable-libatomic=system
--enable-gmp=system
--enable-boehm=yes
--srcdir="${PWD}/../src"
{% endblock %}
