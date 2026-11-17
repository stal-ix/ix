{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
simdutf
{% endblock %}

{% block version %}
9.4.0
{% endblock %}

{% block fetch %}
https://github.com/simdutf/simdutf/archive/refs/tags/v{{self.version().strip()}}.tar.gz
361555059c963a1e5d78f3c7d42f35a19722b0333e6385994ff0fe7d80a5786a
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
