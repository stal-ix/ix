{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
pangomm
{% endblock %}

{% block version %}
2.46.2
{% endblock %}

{% block fetch %}
https://download.gnome.org/sources/pangomm/2.46/pangomm-{{self.version().strip()}}.tar.xz
57442ab4dc043877bfe3839915731ab2d693fc6634a71614422fb530c9eaa6f4
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/pango
lib/glib/mm
lib/cairo/mm/14
{% endblock %}
