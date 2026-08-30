{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
spotify-qt
{% endblock %}

{% block version %}
4.0.4
{% endblock %}

{% block fetch %}
https://github.com/kraxarn/spotify-qt/archive/refs/tags/v{{self.version().strip()}}.tar.gz
10656f4c980c8d4b90f11879a6a58fe542e8b0ef1212297a700bcde3d9a6e396
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
