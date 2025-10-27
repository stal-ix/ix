{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
valgrind
{% endblock %}

{% block version %}
3.26.0
{% endblock %}

{% block fetch %}
https://sourceware.org/pub/valgrind/valgrind-{{self.version().strip()}}.tar.bz2
8d54c717029106f1644aadaf802ab9692e53d93dd015cbd19e74190eba616bd7
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
