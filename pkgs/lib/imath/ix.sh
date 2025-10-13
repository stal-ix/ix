{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
Imath
{% endblock %}

{% block version %}
3.2.2
{% endblock %}

{% block fetch %}
https://github.com/AcademySoftwareFoundation/Imath/archive/refs/tags/v{{self.version().strip()}}.tar.gz
b4275d83fb95521510e389b8d13af10298ed5bed1c8e13efd961d91b1105e462
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
