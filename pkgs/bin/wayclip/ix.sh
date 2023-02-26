{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/noocsharp/wayclip/archive/refs/tags/0.4.1.tar.gz
sha:c4fa53618b0869595957e146cb1cfb32309dcbec3ad354ff8e3b075f4219cba8
{% endblock %}

{% block bld_libs %}
lib/c
lib/wayland
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}
