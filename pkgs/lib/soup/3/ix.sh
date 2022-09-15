{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libsoup/-/archive/3.2.0/libsoup-3.2.0.tar.bz2
sha:a6dc512c52aa70fde73e2a75e058d94f873b06722334afe5be072c41daf7e606
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
