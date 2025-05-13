{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
fnott
{% endblock %}

{% block version %}
1.7.1
{% endblock %}

{% block fetch %}
https://codeberg.org/dnkl/fnott/archive/{{self.version().strip()}}.tar.gz
sha:39c732f2ac57d18f24ef9112524d71090e2b68b72a892f4a44f3a77a1f067487
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
