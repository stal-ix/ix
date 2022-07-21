{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/gtkmm/3.24/gtkmm-3.24.5.tar.xz
sha:856333de86689f6a81c123f2db15d85db9addc438bc3574c36f15736aeae22e6
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
