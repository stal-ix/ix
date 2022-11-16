{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/wayland-project/wayland-protocols/archive/refs/tags/1.29.tar.gz
sha:4a85786ae69cd6d53bbe9278572f3c3d6ea342875ea444960edb6089237c3a18
{% endblock %}

{% block bld_tool %}
bin/wayland/scanner
{% endblock %}

{% block bld_libs %}
lib/c
lib/ffi
lib/wayland
{% endblock %}

{% block strip_pc %}
{% endblock %}
