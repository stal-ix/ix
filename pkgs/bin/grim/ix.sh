{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
grim
{% endblock %}

{% block version %}
1.5.0
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/emersion/grim/-/archive/v{{self.version().strip()}}/grim-v{{self.version().strip()}}.tar.bz2
f27cbbc87c191a10b4643cb1f600a3b6cce1613cfb46e4b199b098fb3b83a5a9
{% endblock %}

{% block bld_libs %}
lib/c
lib/png
lib/jpeg
lib/pixman
lib/wayland
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}
