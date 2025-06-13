{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
gtk-layer-shell
{% endblock %}

{% block version %}
0.9.2
{% endblock %}

{% block fetch %}
https://github.com/wmww/gtk-layer-shell/archive/refs/tags/v{{self.version().strip()}}.tar.gz
526dd95c083e2a73eafd8baa1f5d676a36cb80fc8e7b304cbe3efebd62f0600c
{% endblock %}

{% block lib_deps %}
lib/c
lib/gtk/3
lib/wayland
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}
