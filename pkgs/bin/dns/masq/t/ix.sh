{% extends '//die/c/make.sh' %}

{% block pkg_name %}
dnsmasq
{% endblock %}

{% block version %}
2.91
{% endblock %}

{% block fetch %}
https://thekelleys.org.uk/dnsmasq/dnsmasq-{{self.version().strip()}}.tar.xz
f622682848b33677adb2b6ad08264618a2ae0a01da486a93fd8cd91186b3d153
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
