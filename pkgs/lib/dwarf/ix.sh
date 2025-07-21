{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libdwarf
{% endblock %}

{% block version %}
2.1.0
{% endblock %}

{% block fetch %}
https://www.prevanders.net/libdwarf-{{self.version().strip()}}.tar.xz
461bd29cbb9a41c26a25b0e527c3736c772bb7a89f6260d1edb39ab105226e06
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
