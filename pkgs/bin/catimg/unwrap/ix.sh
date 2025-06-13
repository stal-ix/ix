{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
catimg
{% endblock %}

{% block version %}
2.7.0
{% endblock %}

{% block fetch %}
https://github.com/posva/catimg/archive/refs/tags/{{self.version().strip()}}.tar.gz
3a6450316ff62fb07c3facb47ea208bf98f62abd02783e88c56f2a6508035139
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
