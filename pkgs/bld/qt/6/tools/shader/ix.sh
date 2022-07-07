{% extends '//lib/qt/6/shadertools/t/ix.sh' %}

{% block env %}
export Qt6ShaderToolsTools_DIR=${out}/lib/cmake/Qt6ShaderToolsTools
{% endblock %}

{% block postinstall %}
cd ${out}
mv lib old
mkdir -p lib/cmake
mv old/cmake/Qt6ShaderToolsTools lib/cmake/
rm -rf doc include plugins modules old
{% endblock %}
