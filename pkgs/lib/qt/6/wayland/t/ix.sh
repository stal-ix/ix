{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtwayland/archive/refs/tags/v6.5.0.tar.gz
sha:051e999d94c0a01f4f49a97cde394a3bdd326a0ed0f615dcb26c43ff69c8a68e
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
