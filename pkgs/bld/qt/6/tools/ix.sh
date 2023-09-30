{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qttools/archive/refs/tags/v6.5.3.tar.gz
sha:e0f7407ef889688aaddaba3b6984da10e009189659d403e141e3b81580da2294
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/qt/6/base
{% endblock %}

{% block bld_tool %}
bld/qt/6
{% endblock %}

{% block cmake_flags %}
{{super()}}
QT_FEATURE_linguist=ON
QT_FEATURE_designer=OFF
QT_FEATURE_pixeltool=OFF
QT_FEATURE_assistant=OFF
QT_FEATURE_distancefieldgenerator=OFF
QT_FEATURE_qtattributionsscanner=OFF
QT_FEATURE_qtplugininfo=OFF
QT_FEATURE_qdbus=OFF
QT_FEATURE_qtdiag=OFF
{% endblock %}

{% block env %}
export Qt6LinguistTools_DIR="${out}/lib/cmake/Qt6LinguistTools"
{% endblock %}
