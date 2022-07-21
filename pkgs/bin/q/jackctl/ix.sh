{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://download.sourceforge.net/qjackctl/qjackctl-0.9.7.tar.gz
sha:524843618152070c90a40a18d0e9a16e784424ce54231aff5c0ced12f2769080
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/jack/2
lib/wayland
lib/execinfo
lib/qt/6/base
lib/qt/6/deps
{% endblock %}

{% block bld_tool %}
bld/qt/6
bld/qt/6/tools
{% endblock %}

{% block cmake_flags %}
CONFIG_WAYLAND=ON
CONFIG_STACKTRACE=ON
{% endblock %}
