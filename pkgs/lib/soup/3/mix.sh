{% extends '//mix/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libsoup/-/archive/3.0.5/libsoup-3.0.5.tar.bz2
sha:
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/psl
lib/glib
lib/brotli
lib/sqlite3
lib/nghttp2
{% endblock %}

{% block bld_libs %}
{% if bin %}
lib/glib/networking
{% endif %}
{% endblock %}

{% block bld_tool %}
bin/glib/codegen
{% endblock %}

{% block meson_flags %}
tls_check=false
tests=false
{% endblock %}
