{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://sourceware.org/pub/valgrind/valgrind-3.22.0.tar.bz2
sha:c811db5add2c5f729944caf47c4e7a65dcaabb9461e472b578765dd7bf6d2d4c
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
