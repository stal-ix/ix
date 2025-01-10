{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/upower/upower/-/archive/v1.90.7/upower-v1.90.7.tar.bz2
sha:ed1869c2c06fe30e3f5ce29c2835cfe885176bc5806e4f194745560aec7291e6
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
{% endblock %}

{% block meson_tool %}
bld/meson/4
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
