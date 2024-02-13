{% extends '//die/c/make.sh' %}

{% block fetch %}
https://thekelleys.org.uk/dnsmasq/dnsmasq-2.90.tar.xz
sha:8e50309bd837bfec9649a812e066c09b6988b73d749b7d293c06c57d46a109e4
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
