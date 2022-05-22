{% extends '//die/autohell.sh' %}

{% block fetch %}
https://sourceware.org/pub/valgrind/valgrind-3.19.0.tar.bz2
sha:dd5e34486f1a483ff7be7300cc16b4d6b24690987877c3278d797534d6738f02
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/perl
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block patch %}
sed -e 's|.*If this is glibc then figure out.*|export GLIBC_VERSION=musl|' -i configure

find . -type f | while read l; do
    sed -e 's|-lgcc||g' -i ${l}
done
{% endblock %}
