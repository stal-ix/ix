{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
CopyQ
{% endblock %}

{% block version %}
17.0.0
{% endblock %}

{# no wayland support currently #}

{% block fetch %}
https://github.com/hluk/CopyQ/archive/refs/tags/v{{self.version().strip()}}.tar.gz
78c73c6213fe4cf0c91e462c9372228af17c72448a1a69c9e4b0d28c79ff5fbc
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
WITH_QCA_ENCRYPTION=OFF
WITH_AUDIO=OFF
{% endblock %}

{% block cpp_defines %}
NO_GLOBAL_SHORTCUTS=1
{% endblock %}
