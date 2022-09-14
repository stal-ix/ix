{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/gtkmm/3.24/gtkmm-3.24.7.tar.xz
sha:1d7a35af9c5ceccacb244ee3c2deb9b245720d8510ac5c7e6f4b6f9947e6789c
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/gtk/3
lib/atk/mm
lib/glib/mm
lib/sigc++/2
lib/pango/mm
lib/cairo/mm/14
{% endblock %}
