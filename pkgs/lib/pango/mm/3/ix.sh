{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
pangomm
{% endblock %}

{% block version %}
2.56.2
{% endblock %}

{% block fetch %}
https://download.gnome.org/sources/pangomm/2.56/pangomm-{{self.version().strip()}}.tar.xz
f1e984c85a85b6a0e61616366521f51dd8282a072bb45d15b5084762b62f4c0e
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/pango
lib/glib/mm/3
lib/cairo/mm/18
{% endblock %}
