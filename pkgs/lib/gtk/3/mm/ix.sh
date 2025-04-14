{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
gtkmm
{% endblock %}

{% block version %}
3.24.10
{% endblock %}

{% block fetch %}
https://download.gnome.org/sources/gtkmm/3.24/gtkmm-{{self.version().strip()}}.tar.xz
sha:7ab7e2266808716e26c39924ace1fb46da86c17ef39d989624c42314b32b5a76
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
