{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
gtkmm
{% endblock %}

{% block version %}
4.22.0
{% endblock %}

{% block fetch %}
https://download.gnome.org/sources/gtkmm/{{self.version().strip()[:4]}}/gtkmm-{{self.version().strip()}}.tar.xz
2e8a21b4b0725f620e33aaee0cd343ed121b533275b632896619b1c89e96de67
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
