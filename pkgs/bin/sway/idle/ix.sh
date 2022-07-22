{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/swaywm/swayidle/archive/refs/tags/1.7.1.tar.gz
sha:6aa07093be553473726e1ef601dbc5e57a3ea2ac864ef2d7afce1f971ea760a6
{% endblock %}

{% block bld_libs %}
lib/c
lib/wayland
{% endblock %}

{% block bld_tool %}
bin/scdoc
bld/wayland
{% endblock %}
