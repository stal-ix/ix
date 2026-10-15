{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libsoup
{% endblock %}

{% block version %}
3.8.0
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libsoup/-/archive/{{self.version().strip()}}/libsoup-{{self.version().strip()}}.tar.bz2
7efa1f8c4c790a9fc3e3f052804575c3d22073dfada303ac8f841c590b42179b
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
