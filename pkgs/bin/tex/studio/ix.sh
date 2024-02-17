{% extends '//die/c/cmake.sh' %}

{# hard X11 dep #}

{% block fetch %}
https://github.com/texstudio-org/texstudio/archive/refs/tags/4.7.2.tar.gz
sha:c40bcdd50bb97d0174a6f67c6e2e3e135b265579185490c6757c30689ff7353d
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/shim/x11
lib/qt/6/base
lib/qt/6/deps
lib/qt/6/compat
lib/qt/6/declarative
{% endblock %}

{% block bld_tool %}
bld/qt/6
bld/qt/6/tools
bld/qt/6/tools/qml
{% endblock %}
