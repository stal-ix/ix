{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/ammen99/wf-recorder/archive/refs/tags/v0.3.0.tar.gz
sha:3af1e933872653233d87167bab73d96f984d00e995385190b586be4d89dbbfdf
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/ffmpeg
lib/wayland
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}
