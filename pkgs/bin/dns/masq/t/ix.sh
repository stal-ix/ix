{% extends '//die/c/make.sh' %}

{% block pkg_name %}
dnsmasq
{% endblock %}

{% block version %}
2.92
{% endblock %}

{% block fetch %}
https://thekelleys.org.uk/dnsmasq/dnsmasq-{{self.version().strip()}}.tar.xz
4bf50c2c1018f9fbc26037df51b90ecea0cb73d46162846763b92df0d6c3a458
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
