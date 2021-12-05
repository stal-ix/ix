{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://common-lisp.net/project/ecl/static/files/release/ecl-21.2.1.tgz
0c9e0437dbf3a7f1b00da32b7794a3b0
{% endblock %}

{% block bld_libs %}
lib/boehmgc/mix.sh
lib/gmp/mix.sh
lib/ffi/mix.sh
{% endblock %}

{% block unpack %}
{{super()}}
mkdir build && cd build
{% endblock %}

{% block autoconf_script %}
../src/configure
{% endblock %}

{% block coflags %}
--enable-threads=yes
--enable-libatomic=system
--enable-gmp=system
--enable-boehm=yes
--srcdir="${PWD}/../src"
{% endblock %}
