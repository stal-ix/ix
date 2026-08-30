{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
upower
{% endblock %}

{% block version %}
1.91.3
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/upower/upower/-/archive/v{{self.version().strip()}}/upower-v{{self.version().strip()}}.tar.bz2
12227b3dcd34c5097bbda25984b192ea0bd5e11dce479358d9ef70415a38e4b6
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
