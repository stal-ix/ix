{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libsoup/-/archive/3.0.4/libsoup-3.0.4.tar.bz2
8af3264ea455503dba912f62d4f1dd08
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
{% if kind == 'bin' %}
lib/glib/networking
{% endif %}
{% endblock %}

{% block bld_tool %}
lib/glib
{% endblock %}

{% block meson_flags %}
tls_check=false
tests=false
{% endblock %}
