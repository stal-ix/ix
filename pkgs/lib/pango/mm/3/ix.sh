{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/pangomm/2.54/pangomm-2.54.0.tar.xz
sha:4a5b1fd1b7c47a1af45277ea82b5abeaca8e08fb10a27daa6394cf88d74e7acf
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/pango
lib/glib/mm/3
lib/cairo/mm/16
{% endblock %}
