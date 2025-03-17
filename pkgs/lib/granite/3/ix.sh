{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/elementary/granite/archive/refs/tags/6.2.0.tar.gz
sha:067d31445da9808a802fca523630c3e4b84d2d7c78ae547ced017cb7f3b9c6b5
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
bld/gettext
{% endblock %}
