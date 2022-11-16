{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/libcgroup/libcgroup/releases/download/v2.0.2/libcgroup-2.0.2.tar.gz
sha:8ef63b32e0aff619547dbb8a25e1f6bab152d7c4864795cf915571a5994d0cf8
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/fts
lib/kernel
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
{% endblock %}

{% block configure_flags %}
--enable-pam=no
--enable-tools=no
--enable-daemon=no
{% endblock %}
