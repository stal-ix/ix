{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
date
{% endblock %}

{% block version %}
3.0.4
{% endblock %}

{% block fetch %}
https://github.com/HowardHinnant/date/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:56e05531ee8994124eeb498d0e6a5e1c3b9d4fccbecdf555fe266631368fb55f
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
ENABLE_DATE_TESTING=OFF
BUILD_TZ_LIB=ON
USE_SYSTEM_TZ_DB=ON
{% endblock %}
