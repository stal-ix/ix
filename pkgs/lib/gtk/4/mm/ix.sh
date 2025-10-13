{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
gtkmm
{% endblock %}

{% block version %}
4.20.0
{% endblock %}

{% block fetch %}
https://download.gnome.org/sources/gtkmm/{{self.version().strip()[:4]}}/gtkmm-{{self.version().strip()}}.tar.xz
daad9bf9b70f90975f91781fc7a656c923a91374261f576c883cd3aebd59c833
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
