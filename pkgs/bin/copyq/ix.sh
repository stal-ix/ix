{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
CopyQ
{% endblock %}

{% block version %}
11.0.0
{% endblock %}

{# no wayland support currently #}

{% block fetch %}
https://github.com/hluk/CopyQ/archive/refs/tags/v{{self.version().strip()}}.tar.gz
57b58d66f3b8784e34b8ab986529f19197862f77c8d66be83b44341e0bc17e9d
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/k/ecm
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
WITH_NATIVE_NOTIFICATIONS=OFF
{% endblock %}

{% block cpp_defines %}
NO_GLOBAL_SHORTCUTS=1
{% endblock %}
