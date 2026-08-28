{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libadwaita
{% endblock %}

{% block version %}
1.9.3
{% endblock %}

{% block fetch %}
https://github.com/GNOME/libadwaita/archive/refs/tags/{{self.version().strip()}}.tar.gz
3e4cf25e389a81ad2b73b6f43721b268acd77e393090af06e4dc477c4b39c523
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
