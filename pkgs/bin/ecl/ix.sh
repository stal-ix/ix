{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
ecl
{% endblock %}

{% block version %}
24.5.10
{% endblock %}

{% block fetch %}
https://common-lisp.net/project/ecl/static/files/release/ecl-{{self.version().strip()}}.tgz
e4ea65bb1861e0e495386bfa8bc673bd014e96d3cf9d91e9038f91435cbe622b
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
