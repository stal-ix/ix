{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qttools/archive/refs/tags/v6.5.0.tar.gz
sha:e775a323eab8acb4367f910b572ffacb71dc91d78d79f31eee472ae4214ba5e9
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
