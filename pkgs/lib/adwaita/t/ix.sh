{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libadwaita
{% endblock %}

{% block version %}
1.8.4
{% endblock %}

{% block fetch %}
https://github.com/GNOME/libadwaita/archive/refs/tags/{{self.version().strip()}}.tar.gz
200b5b2e55d8afadccb7d0257fbc7da7ca9d51480f07b812cdd6b6cf51eb0d0c
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
