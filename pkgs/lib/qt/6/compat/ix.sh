{% extends '//die/c/qt.sh' %}

{% block pkg_name %}
qt5compat
{% endblock %}

{% block version %}
6.12.0
{% endblock %}

{% block fetch %}
https://github.com/qt/qt5compat/archive/refs/tags/v{{self.version().strip()}}.tar.gz
c8a528b2f7d158ee76cdc61f24f7ea067ae27a0ede6968679cf9ba3ac1b24e05
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/qt/6/base
lib/qt/6/declarative
{% endblock %}

{% block bld_tool %}
bld/qt/6
bld/qt/6/tools
bld/qt/6/tools/qml
bld/qt/6/tools/shader
{% endblock %}
