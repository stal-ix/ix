{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
gtk-layer-shell
{% endblock %}

{% block version %}
0.10.0
{% endblock %}

{% block fetch %}
https://github.com/wmww/gtk-layer-shell/archive/refs/tags/v{{self.version().strip()}}.tar.gz
ed9bb801d6d9252defba41104820ace595dac824dc8972a758ee2ad134e10505
{% endblock %}

{% block lib_deps %}
lib/c
lib/gtk/3
lib/wayland
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}
