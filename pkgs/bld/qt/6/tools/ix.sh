{% extends '//die/c/qt.sh' %}

{% block pkg_name %}
qttools
{% endblock %}

{% block version %}
6.12.0
{% endblock %}

{% block fetch %}
https://github.com/qt/qttools/archive/refs/tags/v{{self.version().strip()}}.tar.gz
eff0ab495ca82147052ed7a2e92cc222a6171ae28f7d0a11aa867054139092cf
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
