{% extends '//die/c/make.sh' %}

{% block git_repo %}
https://git.kernel.org/pub/scm/network/iproute2/iproute2.git
{% endblock %}

{% block git_branch %}
v6.4.0
{% endblock %}

{% block git_sha %}
e7d3b96fc5630d02ed41f89be2b241b1ff63d991d43e01f0add1ec7e62cecd64
{% endblock %}

{% block bld_libs %}
lib/c
lib/bpf
lib/cap
lib/mnl
lib/tirpc
lib/elfutils
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
bld/pkg/config
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
PREFIX=/
DESTDIR=${out}
SBINDIR=/bin
{% endblock %}
