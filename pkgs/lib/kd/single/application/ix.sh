{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
KDSingleApplication
{% endblock %}

{% block version %}
1.2.0
{% endblock %}

{% block fetch %}
https://github.com/KDAB/KDSingleApplication/archive/refs/tags/v{{self.version().strip()}}.tar.gz
ff4ae6a4620beed1cdb3e6a9b78a17d7d1dae7139c3d4746d4856b7547d42c38
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/qt/6/base
{% endblock %}

{% block cmake_flags %}
KDSingleApplication_QT6=true
KDSingleApplication_STATIC=true
KDSingleApplication_EXAMPLES=false
{% endblock %}
