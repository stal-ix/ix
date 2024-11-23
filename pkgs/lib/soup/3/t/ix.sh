{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libsoup/-/archive/3.6.1/libsoup-3.6.1.tar.bz2
sha:d52815747b4151fb3efc386bcbc5c0a11a1f3aa138ab5db3a9c2f645f403f294
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
