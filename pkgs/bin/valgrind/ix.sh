{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
valgrind
{% endblock %}

{% block version %}
3.28.0
{% endblock %}

{% block fetch %}
https://sourceware.org/pub/valgrind/valgrind-{{self.version().strip()}}.tar.bz2
9f7a18d128f05d3a80fea53e6953f34aad7200a425ceaee46099a8a798a7dd9c
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
