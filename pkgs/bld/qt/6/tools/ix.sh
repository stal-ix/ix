{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qttools/archive/refs/tags/v6.4.1.tar.gz
sha:81b705e6fd4bee56f40fe9f4bc1621bbe0dc590cfdc07380e29064a146cdeb34
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

{% block postinstall %}
:
{% endblock %}

{% block env %}
export Qt6LinguistTools_DIR="${out}/lib/cmake/Qt6LinguistTools"
{% endblock %}
