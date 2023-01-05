{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtwayland/archive/refs/tags/v6.4.2.tar.gz
sha:569e4de9e2ac044c8a02818511f760eb3a8c5c18d36b79e47555dce1152b177f
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
