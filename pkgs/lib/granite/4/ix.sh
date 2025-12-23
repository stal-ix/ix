{% extends '//die/vala/meson.sh' %}

{% block pkg_name %}
granite
{% endblock %}

{% block version %}
7.7.0
{% endblock %}

{% block fetch %}
https://github.com/elementary/granite/archive/refs/tags/{{self.version().strip()}}.tar.gz
e1fe86f95a528fbcc45bbf85b668935dbd2cbf5d128f824d100ff02031ab5441
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
