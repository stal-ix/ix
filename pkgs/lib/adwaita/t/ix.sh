{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libadwaita
{% endblock %}

{% block version %}
1.7.2
{% endblock %}

{% block fetch %}
https://github.com/GNOME/libadwaita/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:2bb5c2182ccf6dd29518043df66038020abfa738683de30fc1b8a16203d03723
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
