{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libtsm
{% endblock %}

{% block version %}
4.3.0
{% endblock %}

{% block fetch %}
https://github.com/Aetf/libtsm/archive/refs/tags/v{{self.version().strip()}}.tar.gz
7e858bece0df5b0cc61fbcc99275f6828bf54007a88fa8459a8447a7ee7e67ad
{% endblock %}

{% block lib_deps %}
lib/c
lib/xkb/common
{% endblock %}

{% block cpp_defines %}
static_assert=_Static_assert
{% endblock %}
