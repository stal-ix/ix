{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
granite
{% endblock %}

{% block version %}
6.2.0
{% endblock %}

{% block fetch %}
https://github.com/elementary/granite/archive/refs/tags/{{self.version().strip()}}.tar.gz
067d31445da9808a802fca523630c3e4b84d2d7c78ae547ced017cb7f3b9c6b5
{% endblock %}

{% block lib_deps %}
lib/c
lib/gee
lib/gtk/3
{% endblock %}

{% block bld_data %}
lib/gee/gir
lib/glib/gir
lib/gtk/3/gir
lib/pango/gir
lib/harfbuzz/gir
lib/gdk/pixbuf/gir
{% endblock %}

{% block bld_tool %}
bld/gir
bin/vala
bld/gnome
{% endblock %}
