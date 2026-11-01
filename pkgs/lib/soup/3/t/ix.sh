{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libsoup
{% endblock %}

{% block version %}
3.8.1
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libsoup/-/archive/{{self.version().strip()}}/libsoup-{{self.version().strip()}}.tar.bz2
e104a3d68c9336b5ca7cd99c67c13b492a1fac95009b6fbce668722f12b0138d
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/psl
lib/glib
lib/brotli
lib/sqlite/3
lib/ng/http/2
{% endblock %}

{% block bld_tool %}
bld/glib
{% endblock %}

{% block meson_flags %}
tests=false
tls_check=false
{% endblock %}
