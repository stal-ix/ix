{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
ecl
{% endblock %}

{% block version %}
26.5.5
{% endblock %}

{% block fetch %}
https://common-lisp.net/project/ecl/static/files/release/ecl-{{self.version().strip()}}.tgz
a01a5bcda8c5b73e59dda3494fd13e5fec5db6aa1dad782c3cc3bb57f1633435
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
