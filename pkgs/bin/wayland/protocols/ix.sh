{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/wayland-project/wayland-protocols/archive/refs/tags/1.27.tar.gz
sha:6dd6ee86478adf4347f3b8b4f3da62dbe9e44912c9cef21cf99abfe692313df4
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
