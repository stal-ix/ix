{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/Hjdskes/cage/archive/refs/tags/v0.1.4.tar.gz
sha:dfe27fb0c7d43db72d6c82f01e2736580a0791a23ba69d7b56285d08af98ad90
{% endblock %}

{% block bld_libs %}
lib/c
lib/wlroots/14
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}
