{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://download.sourceforge.net/qjackctl/qjackctl-0.9.10.tar.gz
sha:9c07a8a98744b42c53a93864e47842d818dfaaea85078356851c6592997f1eee
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
