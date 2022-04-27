{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://dl.xpdfreader.com/xpdf-4.04.tar.gz
sha:63ce23fcbf76048f524c40be479ac3840d7a2cbadb6d1e0646ea77926656bade
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/png
lib/freetype
lib/qt/6/base
{% endblock %}

{% block bld_tool %}
bld/qt/6
{% endblock %}
