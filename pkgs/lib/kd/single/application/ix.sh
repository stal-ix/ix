{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
KDSingleApplication
{% endblock %}

{% block version %}
1.1.0
{% endblock %}

{% block fetch %}
https://github.com/KDAB/KDSingleApplication/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:1f19124c0aa5c6fffee3da174f7d2e091fab6dca1e123da70bb0fe615bfbe3e8
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
