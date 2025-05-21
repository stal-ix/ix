{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
valgrind
{% endblock %}

{% block version %}
3.25.1
{% endblock %}

{% block fetch %}
https://sourceware.org/pub/valgrind/valgrind-{{self.version().strip()}}.tar.bz2
sha:61deb8d0727b45c268efdc1b3b6c9e679cd97cbf5ee4b28d1dead7c8b7a271af
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
