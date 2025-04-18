{% extends '//die/c/meson.sh' %}

# noauto

{% block pkg_name %}
atkmm
{% endblock %}

{% block version %}
2.28.4
{% endblock %}

{% block fetch %}
https://download.gnome.org/sources/atkmm/2.28/atkmm-{{self.version().strip()}}.tar.xz
sha:0a142a8128f83c001efb8014ee463e9a766054ef84686af953135e04d28fdab3
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
