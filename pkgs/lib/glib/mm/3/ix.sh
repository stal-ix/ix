{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
glibmm
{% endblock %}

{% block version %}
2.88.1
{% endblock %}

{% block fetch %}
https://download.gnome.org/sources/glibmm/{{self.version()[:4]}}/glibmm-{{self.version().strip()}}.tar.xz
c139f962b1575c8827cd39d1ac21b7a367be3bda1409c0c7e21a29090f371506
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/sigc++/3
{% endblock %}
