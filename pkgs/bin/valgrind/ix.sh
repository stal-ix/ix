{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
valgrind
{% endblock %}

{% block version %}
3.25.0
{% endblock %}

{% block fetch %}
https://sourceware.org/pub/valgrind/valgrind-{{self.version().strip()}}.tar.bz2
sha:295f60291d6b64c0d90c1ce645634bdc5361d39b0c50ecf9de6385ee77586ecc
{% endblock %}

{% block bld_libs %}
lib/c
lib/shim/fake(lib_name=gcc)
{% endblock %}

{% block bld_tool %}
bld/perl
{% endblock %}

{% block build_flags %}
wrap_cc
fix_shebangs
{% endblock %}

{% block patch %}
sed -e 's|.*If this is glibc then figure out.*|export GLIBC_VERSION=musl|' -i configure
{% endblock %}
