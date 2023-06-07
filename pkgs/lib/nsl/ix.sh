{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/thkukuk/libnsl/releases/download/v2.0.0/libnsl-2.0.0.tar.xz
sha:2da075ef1893ebdfc5f074f83ac811873dc06fd5c62bc9a4729fd2e27a40341a
{% endblock %}

{% block lib_deps %}
lib/c
lib/tirpc
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}
