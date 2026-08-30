{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
valgrind
{% endblock %}

{% block version %}
3.27.1
{% endblock %}

{% block fetch %}
https://sourceware.org/pub/valgrind/valgrind-{{self.version().strip()}}.tar.bz2
5d589152eb8071c02feab8ce6ab719e431a1fbc3e2b1700f5432632a8b9264dc
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
