{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtwayland/archive/refs/tags/v6.4.3.tar.gz
sha:56bed2ccbc105541043826166f5ca20aa2bb7f197b6c31cc21d772f24f328238
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
