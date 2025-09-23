{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libxmlb
{% endblock %}

{% block version %}
0.3.24
{% endblock %}

{% block fetch %}
https://github.com/hughsie/libxmlb/archive/refs/tags/{{self.version().strip()}}.tar.gz
45245a5ebe8a3598449f4d53a576801bdb6489aae03ff2206ad4fc7799611014
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
