{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
Imath
{% endblock %}

{% block version %}
3.2.1
{% endblock %}

{% block fetch %}
https://github.com/AcademySoftwareFoundation/Imath/archive/refs/tags/v{{self.version().strip()}}.tar.gz
b2c8a44c3e4695b74e9644c76f5f5480767355c6f98cde58ba0e82b4ad8c63ce
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
