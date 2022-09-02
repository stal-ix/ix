{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libsoup/-/archive/3.0.8/libsoup-3.0.8.tar.bz2
sha:0fde1763c156ceee487489b357e173b6dab418669790300b66d5a99070c92f15
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
