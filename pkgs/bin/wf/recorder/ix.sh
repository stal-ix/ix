{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/ammen99/wf-recorder/archive/refs/tags/v0.4.1.tar.gz
sha:486e9c03693026e7e287e9cddda5b78488b22706aed1ab789e19ffd09e4adfda
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/opengl
lib/ffmpeg
lib/wayland
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}
