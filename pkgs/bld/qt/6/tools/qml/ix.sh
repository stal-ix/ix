{% extends 't/ix.sh' %}

{% block cmake_flags %}
QT_FORCE_FIND_TOOLS=ON
QT_FORCE_BUILD_TOOLS=ON
QT_WILL_BUILD_TOOLS=ON
QT_BUILD_TOOLS_WHEN_CROSSCOMPILING=ON
QT_FEATURE_cross_compile=OFF
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
