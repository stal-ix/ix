{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/gtkmm/3.24/gtkmm-3.24.8.tar.xz
sha:d2940c64922e5b958554b23d4c41d1839ea9e43e0d2e5b3819cfb46824a098c4
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
