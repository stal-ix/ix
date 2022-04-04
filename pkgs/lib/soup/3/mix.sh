{% extends '//mix/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libsoup/-/archive/3.0.6/libsoup-3.0.6.tar.bz2
sha:985d4271533d1e510f6e48823eaf058e38811a2a927c2e2413f93f0dcc5a9c41
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/psl
lib/glib
lib/brotli
lib/sqlite3
lib/ng/http/2
{% endblock %}

{% block bld_tool %}
bld/glib/codegen
{% endblock %}

{% block meson_flags %}
tls_check=false
tests=false
{% endblock %}
