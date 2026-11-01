{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
catimg
{% endblock %}

{% block version %}
2.8.0
{% endblock %}

{% block fetch %}
https://github.com/posva/catimg/archive/refs/tags/v{{self.version().strip()}}.tar.gz
1f4f54c237cd3b70c8a125044eb2578e8263c12b42d401a42c02c32f10f62548
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block cpp_missing %}
stdio.h
unistd.h
{% endblock %}

{% block cpp_defines %}
_GNU_SOURCE=1
{% endblock %}
