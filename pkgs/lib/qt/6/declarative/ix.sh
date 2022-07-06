{% extends '//lib/qt/6/declarative/t/ix.sh' %}

{% block bld_tool %}
{{super()}}
bld/qt/6/tools/qml
{% endblock %}

{% block cmake_flags %}
{{super()}}
Qt6QmlTools_DIR=${bin_qt_6_tools_qml}/lib/cmake/Qt6QmlTools
{% endblock %}

{% block postinstall %}
:
{% endblock %}
