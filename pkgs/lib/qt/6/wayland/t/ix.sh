{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtwayland/archive/refs/tags/v6.5.3.tar.gz
sha:e9bdfb34f1df10c684d920a74a36583e81294448c051bd4da1e8e13100c978f6
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
