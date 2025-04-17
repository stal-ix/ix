{% extends '//die/c/meson.sh' %}

# noauto

{% block pkg_name %}
atkmm
{% endblock %}

{% block version %}
2.36.3
{% endblock %}

{% block fetch %}
https://download.gnome.org/sources/atkmm/2.28/atkmm-{{self.version().strip()}}.tar.xz
sha:1111111111111111111111111111111111111111111111111111111111111111
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
