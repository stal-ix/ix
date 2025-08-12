{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
Imath
{% endblock %}

{% block version %}
3.2.0
{% endblock %}

{% block fetch %}
https://github.com/AcademySoftwareFoundation/Imath/archive/refs/tags/v{{self.version().strip()}}.tar.gz
f3c0c4210b5e6fe17d90cd7ebbe9638eea9fb458421d00eddb4d1a9d5ad47b36
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
