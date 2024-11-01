{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://sourceware.org/pub/valgrind/valgrind-3.24.0.tar.bz2
sha:71aee202bdef1ae73898ccf7e9c315134fa7db6c246063afc503aef702ec03bd
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
