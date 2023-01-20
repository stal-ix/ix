{% extends '//die/c/cmake.sh' %}

{# no wayland support currently #}

{% block fetch %}
https://github.com/hluk/CopyQ/archive/refs/tags/v6.4.0.tar.gz
sha:ac6757a10ed2d629de9acbb646cdbba5cf51197e9dfe39d3db2ff34069fc4831
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/qt/6/base
lib/qt/6/deps
lib/qt/6/declarative
{% endblock %}

{% block bld_tool %}
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
