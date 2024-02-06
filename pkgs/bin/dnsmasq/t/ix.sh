{% extends '//die/c/make.sh' %}

{% block fetch %}
https://thekelleys.org.uk/dnsmasq/dnsmasq-2.89.tar.xz
sha:02bd230346cf0b9d5909f5e151df168b2707103785eb616b56685855adebb609
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
{% endblock %}

{% block setup_target_flags %}
export COPTS="-DHAVE_NETTLEHASH -DHAVE_LIBIDN2"
{% endblock %}

{% block make_flags %}
COPTS="${COPTS}"
BINDIR=${out}/bin
{% endblock %}
