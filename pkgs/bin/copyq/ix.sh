{% extends '//die/c/cmake.sh' %}

{# no wayland support currently #}

{% block fetch %}
https://github.com/hluk/CopyQ/archive/refs/tags/v7.0.0.tar.gz
sha:5898ba2025f8e9f61a4b4732e85adf3b1653fad20b5c1f1b0c879a7b72cd4d48
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/qt/6/base
lib/qt/6/deps
lib/qt/6/declarative
{% endblock %}

{% block bld_tool %}
bld/icu
bld/qt/6
bld/qt/6/tools
bld/qt/6/tools/qml
{% endblock %}

{% block cmake_flags %}
USE_QXT=OFF
WITH_QT6=ON
WITH_PLUGINS=OFF
{% endblock %}

{% block cpp_defines %}
NO_GLOBAL_SHORTCUTS=1
{% endblock %}
