{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libdwarf
{% endblock %}

{% block version %}
2.2.0
{% endblock %}

{% block fetch %}
https://www.prevanders.net/libdwarf-{{self.version().strip()}}.tar.xz
54c0abbbeb4190bd1babb5d28574d2b20c2309343ec764cc7ca611e527ee4a42
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
