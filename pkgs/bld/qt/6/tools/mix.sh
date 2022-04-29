{% extends '//mix/qt.sh' %}

{% block fetch %}
https://github.com/qt/qttools/archive/refs/tags/v6.3.0.tar.gz
sha:cbc1f62d5c1884daa79b54928a55aad0097d249c9cb97dd15dec182e845505f7
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/qt/6/base
{% endblock %}

{% block bld_tool %}
bld/qt/6
{% endblock %}

{% block qt_cross_flags %}
{% endblock %}

{% block cmake_flags %}
QT_FEATURE_linguist=ON
QT_FEATURE_designer=ON
QT_FEATURE_pixeltool=OFF
QT_FEATURE_assistant=OFF
QT_FEATURE_distancefieldgenerator=OFF
QT_FEATURE_qtattributionsscanner=OFF
QT_FEATURE_qtplugininfo=OFF
QT_FEATURE_qdbus=OFF
QT_FEATURE_qtdiag=OFF
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block env %}
export Qt6LinguistTools_DIR="${out}/lib/cmake/Qt6LinguistTools"
{% endblock %}
