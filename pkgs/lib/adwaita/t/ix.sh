{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libadwaita
{% endblock %}

{% block version %}
1.7.1
{% endblock %}

{% block fetch %}
https://github.com/GNOME/libadwaita/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:1f8919146d82f23b5cb233aad127a2d27c51fecb1c7242768e82ba90742d307f
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
