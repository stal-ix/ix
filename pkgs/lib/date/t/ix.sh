{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
date
{% endblock %}

{% block version %}
3.0.5
{% endblock %}

{% block fetch %}
https://github.com/HowardHinnant/date/archive/refs/tags/v{{self.version().strip()}}.tar.gz
ef786edc203daec76475825640b3af247bd08e31fc52217e5ce8f76107b4bb05
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
