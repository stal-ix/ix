{% extends '//die/vala/meson.sh' %}

{% block pkg_name %}
granite
{% endblock %}

{% block version %}
7.8.0
{% endblock %}

{% block fetch %}
https://github.com/elementary/granite/archive/refs/tags/{{self.version().strip()}}.tar.gz
df3c3a034ebf5d00d702e418e38c4c68f231930449f6ea2ea7e564364d149b1a
{% endblock %}

{% block lib_deps %}
lib/c
lib/gee
lib/gtk/4
{% endblock %}

{% block bld_data %}
lib/gee/gir
lib/glib/gir
lib/gtk/4/gir
lib/pango/gir
lib/graphene/gir
lib/harfbuzz/gir
lib/gdk/pixbuf/gir
{% endblock %}

{% block bld_tool %}
bin/sassc
bld/gnome
{% endblock %}
