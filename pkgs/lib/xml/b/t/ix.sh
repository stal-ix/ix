{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libxmlb
{% endblock %}

{% block version %}
0.3.23
{% endblock %}

{% block fetch %}
https://github.com/hughsie/libxmlb/archive/refs/tags/{{self.version().strip()}}.tar.gz
3d9b7334e7ab32837ebc1d902620b7938f46c59353e61bf933521acb75181476
{% endblock %}

{% block lib_deps %}
lib/c
lib/xz
lib/zstd
lib/glib
lib/stemmer
{% endblock %}

{% block meson_flags %}
gtkdoc=false
introspection=false
tests=false
{% endblock %}
