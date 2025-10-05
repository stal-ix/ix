{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
simdutf
{% endblock %}

{% block version %}
7.4.0
{% endblock %}

{% block fetch %}
https://github.com/simdutf/simdutf/archive/refs/tags/v{{self.version().strip()}}.tar.gz
8fd729ebfd5ec56cb0395bcc176c4801e1f8a0ea834d166d52279d7b9e801283
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
