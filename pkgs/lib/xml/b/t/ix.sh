{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libxmlb
{% endblock %}

{% block version %}
0.3.29
{% endblock %}

{% block fetch %}
https://github.com/hughsie/libxmlb/archive/refs/tags/{{self.version().strip()}}.tar.gz
b5efb78fc8033672826532e0e81e159dd3b01be7e8c3616e2dfefefc66d28ed6
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
