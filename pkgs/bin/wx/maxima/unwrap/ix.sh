{% extends '//die/c/cmake.sh' %}

{% block version %}
24.11.0
{% endblock %}

{% block fetch %}
https://github.com/wxMaxima-developers/wxmaxima/archive/refs/tags/Version-{{self.version().strip()}}.tar.gz
sha:e01fd8ca9bb8054e38f6d973f619e2549ab6ab9d0aaebae70c4ed73580258055
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
