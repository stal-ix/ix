{% extends '//die/c/meson.sh' %}

{% block version %}
2.56.1
{% endblock %}

{% block fetch %}
https://download.gnome.org/sources/pangomm/2.56/pangomm-{{self.version().strip()}}.tar.xz
sha:539f5aa60e9bdc6b955bb448e2a62cc14562744df690258040fbb74bf885755d
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/pango
lib/glib/mm/3
lib/cairo/mm/16
{% endblock %}
