{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
fnott
{% endblock %}

{% block version %}
1.8.0
{% endblock %}

{% block fetch %}
https://codeberg.org/dnkl/fnott/archive/{{self.version().strip()}}.tar.gz
7e784133bec7cc197bbeed18daf92192f297f7c60d1c25cce318ae09f70ab0e1
{% endblock %}

{% block bld_libs %}
lib/c
lib/png
lib/dbus
lib/kernel
lib/tllist
lib/fcft/3
lib/pixman
lib/wayland
lib/freetype
lib/fontconfig
{% endblock %}

{% block bld_tool %}
bin/scdoc
bld/wayland
{% endblock %}
