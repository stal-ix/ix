{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://libbsd.freedesktop.org/releases/libbsd-0.11.7.tar.xz
sha:9baa186059ebbf25c06308e9f991fda31f7183c0f24931826d83aa6abd8a0261
{% endblock %}

{% block bld_tool %}
bld/auto
{% endblock %}

{% block c_rename_symbol %}
reallocarray
{% endblock %}

{% block setup %}
export CPPFLAGS="-I.. -isystem ../include/bsd ${CPPFLAGS}"
{% endblock %}
