{% extends '//die/c/make.sh' %}

{% block git_repo %}
https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/keyutils.git
{% endblock %}

{% block git_commit %}
5678a1aae8834b5c16b5ed7dc72ef8836a29e122
{% endblock %}

{% block git_sha %}
bb66c1b437df345123cb7104f6a95755876e04c0e90aa13e9d5624a623a8e38b
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block build_flags %}
shut_up
wrap_cc
{% endblock %}

{% block bld_tool %}
bld/fake(tool_name=rpmspec)
{% endblock %}

{% block make_flags %}
LIBDIR=${out}/lib
INCLUDEDIR=${out}/include
SBINDIR=${out}/bin
SHAREDIR=${out}/share
MANDIR=${out}/man
USRLIBDIR=${out}/lib
BINDIR=${out}/bin
ETCDIR=${out}/etc
{% endblock %}
