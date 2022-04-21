{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/qt/qtwayland/archive/refs/tags/v6.3.0.tar.gz
sha:b12561ef2338b761ab1ff9d4c9359927406260b14ac3558d979c44efce8168be
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/wayland
lib/xkbcommon
lib/qt/6/base
{% endblock %}

{% block bld_tool %}
bld/perl
bin/wayland/protocols
{% endblock %}

{% block setup %}
export CMAKE_PREFIX_PATH="${lib_qt_6_base}"
{% endblock %}

{% block postinstall %}
echo 'TODO(pg): proper solution'
{% endblock %}
