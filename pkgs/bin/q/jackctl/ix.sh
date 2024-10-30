{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://download.sourceforge.net/qjackctl/qjackctl-1.0.3.tar.gz
sha:167fd2a8b4c0dc1b825c26feb58842250057f5290b43404b0952fab4baadf173
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
