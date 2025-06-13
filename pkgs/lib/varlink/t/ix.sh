{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libvarlink
{% endblock %}

{% block version %}
24
{% endblock %}

{% block fetch %}
https://github.com/varlink/libvarlink/archive/refs/tags/{{self.version().strip()}}.tar.gz
0586263ab8f4e8e26a2f2f54830f8f92e403326663b10e14fcf1a6c95e9eab95
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
