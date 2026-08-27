{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
gtk-layer-shell
{% endblock %}

{% block version %}
0.10.1
{% endblock %}

{% block fetch %}
https://github.com/wmww/gtk-layer-shell/archive/refs/tags/v{{self.version().strip()}}.tar.gz
88c3a3e0a5300532f3d368d5df64838a87f1fb85273f22d41df0a6b8d0ec59c6
{% endblock %}

{% block lib_deps %}
lib/c
lib/gtk/3
lib/wayland
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}
