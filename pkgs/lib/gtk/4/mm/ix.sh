{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
gtkmm
{% endblock %}

{% block version %}
4.24.0
{% endblock %}

{% block fetch %}
https://download.gnome.org/sources/gtkmm/{{self.version().strip()[:4]}}/gtkmm-{{self.version().strip()}}.tar.xz
7fd9cea356e7d3b74bf7d2a51d7e0e6763f3f9f1cddc5e77c8b0b5b7fa9d5e5a
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/gtk/4
lib/sigc++/3
lib/glib/mm/3
lib/pango/mm/3
lib/cairo/mm/18
{% endblock %}
