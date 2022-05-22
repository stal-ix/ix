{% extends '//die/qt.sh' %}

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
bin/wayland/protocols
{% endblock %}

{% block qt_cross_flags %}
{% endblock %}
