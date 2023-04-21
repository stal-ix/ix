{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libsoup/-/archive/3.4.1/libsoup-3.4.1.tar.bz2
sha:ede4b2285148ced15d8616694bb6d7bbb046e5ad3eb75bac923a46f81bc538be
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
