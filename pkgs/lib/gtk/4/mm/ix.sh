{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
gtkmm
{% endblock %}

{% block version %}
4.18.0
{% endblock %}

{% block fetch %}
https://download.gnome.org/sources/gtkmm/4.18/gtkmm-{{self.version().strip()}}.tar.xz
sha:2ee31c15479fc4d8e958b03c8b5fbbc8e17bc122c2a2f544497b4e05619e33ec
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
