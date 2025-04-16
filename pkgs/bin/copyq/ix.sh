{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
CopyQ
{% endblock %}

{% block version %}
10.0.0
{% endblock %}

{# no wayland support currently #}

{% block fetch %}
https://github.com/hluk/CopyQ/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:ffbae7a71c55cd89dfd88a6d184c7a5c7a8c4c948e9df11c10640c246d9c5f53
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
