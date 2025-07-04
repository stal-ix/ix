{% extends '//die/c/qt.sh' %}

{% block pkg_name %}
qtcharts
{% endblock %}

{% block version %}
6.7.2
{% endblock %}

{% block fetch %}
https://github.com/qt/qtcharts/archive/refs/tags/v{{self.version().strip()}}.tar.gz
ec6e44444a49a976bfbe993a2a8f5d8a35de66c06fdf16cd2c9a426331477cc3
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/qt/6/base
lib/qt/6/multimedia
lib/qt/6/declarative
{% endblock %}

{% block bld_tool %}
bld/qt/6/tools
bld/qt/6/tools/qml
{% endblock %}
