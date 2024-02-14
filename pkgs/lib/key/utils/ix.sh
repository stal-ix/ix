{% extends '//die/c/make.sh' %}

{% block git_repo %}
https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/keyutils.git
{% endblock %}

{% block git_commit %}
5678a1aae8834b5c16b5ed7dc72ef8836a29e122
{% endblock %}

{% block git_sha %}
4f76a7d450f20ebe98c17e136e72348f471d2c5c0fdebbb180312f7401dab527
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block bld_tool %}
bld/fake(tool_name=rpmspec)
{% endblock %}

{% block make_flags %}
NO_SOLIB=1
LIBDIR=${out}/lib
INCLUDEDIR=${out}/include
SBINDIR=${out}/bin
SHAREDIR=${out}/share
MANDIR=${out}/man
USRLIBDIR=${out}/lib
BINDIR=${out}/bin
ETCDIR=${out}/etc
{% endblock %}
