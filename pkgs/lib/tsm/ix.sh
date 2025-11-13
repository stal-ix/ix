{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libtsm
{% endblock %}

{% block version %}
4.2.0
{% endblock %}

{% block fetch %}
https://github.com/Aetf/libtsm/archive/refs/tags/v{{self.version().strip()}}.tar.gz
1fa400d669a7b31df0e1953a193d648d2da7ebc674e606f10ae36db90c7f5337
{% endblock %}

{% block lib_deps %}
lib/c
lib/xkb/common
{% endblock %}

{% block cpp_defines %}
static_assert=_Static_assert
{% endblock %}
