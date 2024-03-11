{% extends '//die/c/make.sh' %}

{% block git_repo %}
https://git.kernel.org/pub/scm/network/iproute2/iproute2.git
{% endblock %}

{% block git_commit %}
e5fd785830671180e934a84a44da93c51cce839d
{% endblock %}

{% block git_sha %}
79456e007fb719606a8c53443611867ff103a09346a5ca03d3ffd9d82ee0b963
{% endblock %}

{% block bld_libs %}
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
{% endblock %}

{% block configure %}
sh ./configure --prefix=${out}
{% endblock %}

{% block cpp_includes %}
${PWD}/include
{% endblock %}

{% block cpp_missing %}
limits.h
{% endblock %}

{% block make_flags %}
PREFIX=${out}
SBINDIR=${out}/bin
CONF_ETC_DIR=${out}/etc/iproute2
NETNS_RUN_DIR=${out}/var/run/iproute2
NETNS_ETC_DIR=${out}/etc/netns
ARPDDIR=${out}/var/run/arpd
{% endblock %}
