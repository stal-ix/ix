{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libtsm
{% endblock %}

{% block version %}
4.0.2
{% endblock %}

{% block fetch %}
https://github.com/Aetf/libtsm/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:ce51be564872d3e6a35fadab1f74b8804f72d8a92c0f378ca384155134d154e5
{% endblock %}

{% block lib_deps %}
lib/c
lib/xkb/common
{% endblock %}

{% block cpp_defines %}
static_assert=_Static_assert
{% endblock %}
