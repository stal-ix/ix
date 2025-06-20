{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libepoxy
{% endblock %}

{% block version %}
1.5.10
{% endblock %}

{% block fetch %}
https://github.com/anholt/libepoxy/archive/refs/tags/{{self.version().strip()}}.tar.gz
a7ced37f4102b745ac86d6a70a9da399cc139ff168ba6b8002b4d8d43c900c15
{% endblock %}

{% block lib_deps %}
lib/c
lib/opengl
{% endblock %}

{% block meson_flags %}
x11=false
{% endblock %}
