{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtwayland/archive/refs/tags/v6.3.1.tar.gz
sha:2592c78ad72007d50f2505f4b2ec8fec80d135bb5e826261176e0146a0d8aa15
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/wayland
lib/xkbcommon
lib/qt/6/base
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}

{% block patch %}
>src/compositor/global/qwaylandquickextension.cpp
{% endblock %}
