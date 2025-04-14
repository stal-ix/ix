{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
qjackctl
{% endblock %}

{% block version %}
1.0.4
{% endblock %}

{% block fetch %}
https://download.sourceforge.net/qjackctl/qjackctl-{{self.version().strip()}}.tar.gz
sha:e3eb6f989d947dcd97b4fe774294347106a0a6829c0480a965393ebca97514ae
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
