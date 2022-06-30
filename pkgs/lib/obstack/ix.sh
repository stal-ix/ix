{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://github.com/void-linux/musl-obstack/archive/refs/tags/v1.2.2.tar.gz
md5:edee8cb45ca351de5759b85f2aca0f3b
{% endblock %}

{% block autoreconf %}
sh bootstrap.sh
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
