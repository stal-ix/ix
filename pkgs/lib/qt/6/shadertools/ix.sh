{% extends 't/ix.sh' %}

{% block bld_tool %}
bld/qt/6/tools/shader
{{super()}}
{% endblock %}

{% block cmake_flags %}
{{super()}}
QT_WILL_BUILD_TOOLS=OFF
Qt6ShaderToolsTools_DIR=${Qt6ShaderToolsTools_DIR}
{% endblock %}
