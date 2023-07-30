{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/wxMaxima-developers/wxmaxima/archive/refs/tags/Version-23.07.0.tar.gz
sha:410cbd98af570945f0bb619ad8913b32ee90b9369ff7970606b1cdbd6e1a807b
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/wx/widgets
{% endblock %}

{% block bld_tool %}
bld/fakegit
bld/gettext
bin/doxygen
{% endblock %}

{% block cmake_flags %}
WXM_DISABLE_WEBVIEW=ON
{% endblock %}

{% block c_rename_symbol %}
nsvg__colors
nsvg__parseXML
nsvgCreateRasterizer
nsvgDelete
nsvgDeleteRasterizer
nsvgDuplicatePath
nsvgParse
nsvgParseFromFile
nsvgRasterize
{% endblock %}

