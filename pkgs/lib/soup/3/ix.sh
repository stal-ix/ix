{% extends '//die/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libsoup/-/archive/3.0.7/libsoup-3.0.7.tar.bz2
sha:f9fbc36524605ea88e97506659bfbdb048371f1b22d060e9d80aa8f496f7443e
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
bld/glib/codegen
{% endblock %}

{% block meson_flags %}
tls_check=false
tests=false
{% endblock %}

{% block env_lib %}
export CPPFLAGS="-I${out}/include/libsoup-3.0 \${CPPFLAGS}"
{% endblock %}
