{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/GNOME/libadwaita/archive/refs/tags/1.7.0.tar.gz
sha:c09ef6a39b7b5b99302515d6d57b9aaf4d4938e559116812726fc823f983c3cb
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
