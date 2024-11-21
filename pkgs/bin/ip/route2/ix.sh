{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/iproute2/iproute2/archive/refs/tags/v6.12.0.tar.gz
sha:fe6e612a9d04bc96cb557d33e4b6c92a550a08182ee5403bd0dc7008032ec05d
{% endblock %}

{% block bld_libs %}
lib/linux/headers/next
lib/c
lib/bpf
lib/cap
lib/mnl
lib/tirpc
lib/elfutils
lib/shim/gnu/basename/overlay
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
bld/pkg/config
{% endblock %}

{% block patch %}
sed -e "s|/etc/iproute2|${out}/etc/iproute2|" -i Makefile
rm -rf include/uapi
{% endblock %}

{% block configure %}
sh ./configure --prefix=${out}
{% endblock %}

{% block cpp_includes %}
${PWD}/include
{% endblock %}

{% block cpp_defines %}
__UAPI_DEF_IN6_ADDR=0
{% endblock %}

{% block cpp_missing %}
limits.h
endian.h
netinet/in.h
{% endblock %}

{% block make_flags %}
PREFIX=${out}
SBINDIR=${out}/bin
CONF_ETC_DIR=${out}/etc/iproute2
NETNS_RUN_DIR=${out}/var/run/iproute2
NETNS_ETC_DIR=${out}/etc/netns
ARPDDIR=${out}/var/run/arpd
{% endblock %}
