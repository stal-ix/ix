{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://download.sourceforge.net/qjackctl/qjackctl-1.0.2.tar.gz
sha:0c67eec8fa428b10ff7401402a5cf37fc5e27fa6b64087eb77dba385b6c9f017
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
