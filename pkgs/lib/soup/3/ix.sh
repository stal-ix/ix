{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libsoup/-/archive/3.2.2/libsoup-3.2.2.tar.bz2
sha:409f1a7588b0109883297dba19b838ddad6ad66b1b0ad5e8084612446ac53a82
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
