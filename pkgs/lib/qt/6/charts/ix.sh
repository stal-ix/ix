{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtcharts/archive/refs/tags/v6.6.2.tar.gz
sha:c152c7d2c1b166d7af9cd04b92f4dce9c1242496b6ace2bc1c39c6e9b9ad4251
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
