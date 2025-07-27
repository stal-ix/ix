{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
spotify-qt
{% endblock %}

{% block version %}
4.0.1
{% endblock %}

{% block fetch %}
https://github.com/kraxarn/spotify-qt/archive/refs/tags/v{{self.version().strip()}}.tar.gz
75e735fa66eb7d20fd90a9600313a0bb78e071256e528554041641b6076a6b96
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
