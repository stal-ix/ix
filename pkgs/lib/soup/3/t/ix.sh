{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libsoup/-/archive/3.6.5/libsoup-3.6.5.tar.bz2
sha:2048b4b554c16c0aa7fa51a9b12eab9162ec535d22d9c3d0eee135ec37e9a3a5
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
