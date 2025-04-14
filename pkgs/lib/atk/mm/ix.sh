{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
atkmm
{% endblock %}

{% block version %}
2.28.3
{% endblock %}

{% block fetch %}
https://download.gnome.org/sources/atkmm/2.28/atkmm-{{self.version().strip()}}.tar.xz
sha:7c2088b486a909be8da2b18304e56c5f90884d1343c8da7367ea5cd3258b9969
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/atk
lib/glib/mm
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/lib/atkmm-1.6/include \${CPPFLAGS}"
{% endblock %}
