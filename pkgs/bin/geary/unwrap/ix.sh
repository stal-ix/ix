{% extends '//die/c/meson.sh' %}

{# WIP #}

{% block fetch %}
https://gitlab.gnome.org/GNOME/geary/-/archive/46.0/geary-46.0.tar.bz2
sha:0bac78c2dd2736518dd277edfabba6b40a4eacef6f6e27c9468c09be62e10311
{% endblock %}

{% block bld_libs %}
lib/c
lib/gee
lib/gcr
lib/gtk
lib/glib
lib/gmime
lib/sqlite/3
lib/web/kit/gtk
{% endblock %}

{% block bld_tool %}
bld/gir
bin/vala
{% endblock %}

{% block meson_flags %}
profile=release
{% endblock %}
