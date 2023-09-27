{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gobject-introspection/-/archive/1.78.1/gobject-introspection-1.78.1.tar.bz2
sha:a18862a00bb7eed6a3f04e2952737ec814699acc85372ae476534990302c5e0c
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
{% endblock %}

{% block bld_libs %}
lib/python
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
