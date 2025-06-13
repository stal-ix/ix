{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libsoup
{% endblock %}

{% block version %}
3.6.5
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libsoup/-/archive/{{self.version().strip()}}/libsoup-{{self.version().strip()}}.tar.bz2
2048b4b554c16c0aa7fa51a9b12eab9162ec535d22d9c3d0eee135ec37e9a3a5
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
