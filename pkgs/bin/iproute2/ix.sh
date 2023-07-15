{% extends '//die/c/make.sh' %}

{% block git_repo %}
https://git.kernel.org/pub/scm/network/iproute2/iproute2.git
{% endblock %}

{% block git_branch %}
v6.4.0
{% endblock %}

{% block git_sha %}
2b2e6004c7393999a237db5838538a4a30c20b9ba8b163bf70752001d8253d1d
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
