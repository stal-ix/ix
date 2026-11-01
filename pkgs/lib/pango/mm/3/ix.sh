{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
pangomm
{% endblock %}

{% block version %}
2.58.0
{% endblock %}

{% block fetch %}
https://download.gnome.org/sources/pangomm/{{self.version().strip() | field(0)}}.{{self.version().strip() | field(1)}}/pangomm-{{self.version().strip()}}.tar.xz
217514c1a65035c2fce6e69e33b0d92bafa2594cc474e995a4473441b10f3a33
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/pango
lib/glib/mm/3
lib/cairo/mm/18
{% endblock %}
