{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
upower
{% endblock %}

{% block version %}
1.91.5
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/upower/upower/-/archive/v{{self.version().strip()}}/upower-v{{self.version().strip()}}.tar.bz2
c465a1c7fc05d00ac2bc7321c19b9b7e479410d8392bd7eb3e714275729629fd
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
