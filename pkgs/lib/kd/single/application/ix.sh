{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/KDAB/KDSingleApplication/archive/refs/tags/v1.0.0.tar.gz
sha:c493a12ad2d532b342edad7350fd8ed49f589ecfe46c2025b7d5fc4e7f69cbd1
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
