{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
spotify-qt
{% endblock %}

{% block version %}
4.0.0
{% endblock %}

{% block fetch %}
https://github.com/kraxarn/spotify-qt/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:358da63abf1bd0528c7b5e53aa72f2a5df265e9b0b4710cafefba0d0f633a672
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/qt/6/svg
lib/qt/6/base
lib/qt/6/deps
{% endblock %}

{% block cmake_flags %}
USE_QT6=ON
USE_QT5=OFF
{% endblock %}

{% block bld_tool %}
bld/qt/6
bld/qt/6/tools
{% endblock %}
