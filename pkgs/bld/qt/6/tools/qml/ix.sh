{% extends 't/ix.sh' %}

{% block cmake_flags %}
{{super()}}
QT_FORCE_FIND_TOOLS=ON
{% endblock %}

{% block bld_tool %}
bld/qt/6/tools/qml/2
{{super()}}
{% endblock %}

{% block postinstall %}
cd ${out}
mv lib old
mkdir -p lib/cmake
mv old/cmake/Qt6QmlTools lib/cmake/
rm -rf doc include plugins modules old qml
{% endblock %}
