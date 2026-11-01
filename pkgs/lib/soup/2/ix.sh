{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libsoup
{% endblock %}

{% block version %}
2.74.3
{% endblock %}

{% block fetch %}
https://download.gnome.org/sources/libsoup/2.74/libsoup-{{self.version().strip()}}.tar.xz
e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/psl
lib/xml/2
lib/glib
lib/brotli
lib/sqlite/3
{% endblock %}

{% block bld_tool %}
bld/glib
{% endblock %}

{% block meson_flags %}
gnome=false
tls_check=false
{% endblock %}
