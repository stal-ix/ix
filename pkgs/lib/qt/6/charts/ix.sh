{% extends '//die/c/qt.sh' %}

{% block pkg_name %}
qtcharts
{% endblock %}

{% block version %}
6.12.0
{% endblock %}

{% block fetch %}
https://github.com/qt/qtcharts/archive/refs/tags/v{{self.version().strip()}}.tar.gz
b21aaeec3cb7c55bed9ba04cb4a28dc89ff02f4fdb8fcdec91f11e47b91bcb59
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
