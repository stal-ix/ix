{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
upower
{% endblock %}

{% block version %}
1.90.9
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/upower/upower/-/archive/v{{self.version().strip()}}/upower-v{{self.version().strip()}}.tar.bz2
sha:ca6018535817c2ea687e389e6b47583342154123c0eea0497b409c49dff319b6
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
{% endblock %}

{% block meson_strip_dirs %}
{% endblock %}

{% block meson_flags %}
man=false
gtk-doc=false
introspection=disabled
{% endblock %}

{% block bld_tool %}
bld/glib
{% endblock %}

{% block cpp_missing %}
math.h
{% endblock %}
