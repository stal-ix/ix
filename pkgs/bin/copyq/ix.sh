{% extends '//die/c/cmake.sh' %}

{# no wayland support currently #}

{% block fetch %}
https://github.com/hluk/CopyQ/archive/refs/tags/v7.1.0.tar.gz
sha:ce0265b0a86350fda7bfa1a9d4b74d794a4077551b28186012683567d6fd8158
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
