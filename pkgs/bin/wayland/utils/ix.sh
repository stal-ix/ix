{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
wayland-utils
{% endblock %}

{% block version %}
1.2.0
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/wayland/wayland-utils/-/archive/{{self.version().strip()}}/wayland-utils-{{self.version().strip()}}.tar.bz2
f38c6a4ca2113cf716ca687a4cd8e24a11cbeeb04759678b7bb2da7d16335d18
{% endblock %}

{% block bld_libs %}
lib/c
lib/wayland
{% endblock%}

{% block bld_tool %}
bld/wayland
{% endblock %}
