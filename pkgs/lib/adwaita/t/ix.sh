{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libadwaita
{% endblock %}

{% block version %}
1.8.2
{% endblock %}

{% block fetch %}
https://github.com/GNOME/libadwaita/archive/refs/tags/{{self.version().strip()}}.tar.gz
6c9e6c7b1326f9b62e0c5afbc39febedc87a9358e5adde3312de38c9c68021ad
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/gtk/4
lib/fribidi
lib/app/stream
{% endblock %}

{% block bld_tool %}
bld/glib
bin/sassc
{% endblock %}
