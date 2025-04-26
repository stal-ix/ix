{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
spotify-qt
{% endblock %}

{% block version %}
3.12
{% endblock %}

{% block fetch %}
https://github.com/kraxarn/spotify-qt/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:5782ff9cd854aa92b4ba49837d3ed4b5ada0427fd440e16866e9727abcd9df62
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
