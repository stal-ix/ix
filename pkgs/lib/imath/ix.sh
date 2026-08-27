{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
Imath
{% endblock %}

{% block version %}
3.2.3
{% endblock %}

{% block fetch %}
https://github.com/AcademySoftwareFoundation/Imath/archive/refs/tags/v{{self.version().strip()}}.tar.gz
e10c12b3f21f45bf08e09d4215d9c7691368d747beebd840de0b6fefed2df9f8
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
