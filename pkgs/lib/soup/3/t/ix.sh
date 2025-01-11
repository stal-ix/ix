{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libsoup/-/archive/3.6.3/libsoup-3.6.3.tar.bz2
sha:1a5fa841e038aca8a2073e0c1d72db828d4187e8d9ae3ae6bd4e7e7da1617b80
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
