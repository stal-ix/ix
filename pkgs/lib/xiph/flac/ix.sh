{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/xiph/flac/archive/refs/tags/1.4.0.tar.gz
sha:879545395b64c4a9f1ea17ba1b4230fee1c439283b4f692d2f41b48dfcb825a4
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
