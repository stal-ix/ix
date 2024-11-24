{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/gtkmm/4.16/gtkmm-4.16.0.tar.xz
sha:3b23fd3abf8fb223b00e9983b6010af2db80e38c89ab6994b8b6230aa85d60f9
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/gtk/4
lib/sigc++/3
lib/glib/mm/3
lib/pango/mm/3
lib/cairo/mm/16
{% endblock %}
