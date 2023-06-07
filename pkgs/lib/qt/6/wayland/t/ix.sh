{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtwayland/archive/refs/tags/v6.5.1.tar.gz
sha:eeeb9af6056e36cdf80b945c31212de115a3134503c77a87b35930485d7c6596
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
