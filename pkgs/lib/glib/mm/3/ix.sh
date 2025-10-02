{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
glibmm
{% endblock %}

{% block version %}
2.86.0
{% endblock %}

{% block fetch %}
https://download.gnome.org/sources/glibmm/{{self.version()[:4]}}/glibmm-{{self.version().strip()}}.tar.xz
39c0e9f6da046d679390774efdb9ad564436236736dc2f7825e614b2d4087826
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/sigc++/3
{% endblock %}
