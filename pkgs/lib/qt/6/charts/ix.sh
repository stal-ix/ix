{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtcharts/archive/refs/tags/v6.6.0.tar.gz
sha:41f2f162a0897b4af84411c6fdcdf5373b0e05e3a0669c5cea9dfb336d36e92d
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
