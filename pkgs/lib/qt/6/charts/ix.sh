{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtcharts/archive/refs/tags/v6.5.2.tar.gz
sha:3eac9924a53e2379213c35bfa82a49979047470bdfc314c41ea93a61449ca892
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
