{% extends '//die/c/make.sh' %}

{% block fetch %}
https://thekelleys.org.uk/dnsmasq/dnsmasq-2.88.tar.xz
sha:23544deda10340c053bea6f15a93fed6ea7f5aaa85316bfc671ffa6d22fbc1b3
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}

{% block bld_libs %}
lib/c
lib/gmp
lib/dbus
lib/idn/2
lib/nettle
lib/kernel
lib/lua/puc/5/2
{% endblock %}

{% block setup %}
export COPTS="-DHAVE_DBUS -DHAVE_NETTLEHASH -DHAVE_LIBIDN2 -DHAVE_LUASCRIPT"
{% endblock %}

{% block make_flags %}
COPTS="${COPTS}"
BINDIR=${out}/bin
{% endblock %}
