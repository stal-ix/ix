{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libsoup
{% endblock %}

{% block version %}
3.6.6
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libsoup/-/archive/{{self.version().strip()}}/libsoup-{{self.version().strip()}}.tar.bz2
49a0c07b77f7b1e1a49ca38832750971152968f19c7d1814721ab5117f2e7d10
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
