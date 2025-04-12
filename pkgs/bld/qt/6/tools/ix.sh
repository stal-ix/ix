{% extends '//die/c/qt.sh' %}

{% block pkg_name %}
qttools
{% endblock %}

{% block version %}
6.7.2
{% endblock %}

{% block fetch %}
https://github.com/qt/qttools/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:3ae2db630606edf94cc368691ee1da9c0bae7a06ff46c544c459cece8b60b62a
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/qt/6/base/nogui
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
