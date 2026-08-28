{% extends '//die/c/make.sh' %}

{% block pkg_name %}
dnsmasq
{% endblock %}

{% block version %}
2.93
{% endblock %}

{% block fetch %}
https://thekelleys.org.uk/dnsmasq/dnsmasq-{{self.version().strip()}}.tar.xz
0c00d4e5c97c8306e5fb932b348b34269c9c29a0e7df0e8e82958b407092bc19
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}

{% block bld_libs %}
lib/c
lib/gmp
lib/idn/2
lib/nettle
lib/kernel
lib/net/filter/conntrack
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block setup_target_flags %}
export COPTS="-DHAVE_NETTLEHASH -DHAVE_LIBIDN2 -DHAVE_CONNTRACK"
{% endblock %}

{% block make_flags %}
COPTS="${COPTS}"
BINDIR=${out}/bin
{% endblock %}
