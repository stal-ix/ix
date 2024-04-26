{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://sourceware.org/pub/valgrind/valgrind-3.23.0.tar.bz2
sha:c5c34a3380457b9b75606df890102e7df2c702b9420c2ebef9540f8b5d56264d
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
