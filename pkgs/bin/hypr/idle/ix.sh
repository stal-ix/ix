{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
hypridle
{% endblock %}

{% block version %}
0.1.7
{% endblock %}

{% block fetch %}
https://github.com/hyprwm/hypridle/archive/refs/tags/v{{self.version().strip()}}.tar.gz
c4ef2e2894fc2082cfdabe7db086b1f246e3f0de571f7f2c6b26d7c0d9a5f8f3
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/wayland
lib/hypr/lang
lib/sd/bus/c++/2
{% endblock %}

{% block bld_tool %}
bld/wayland
bin/hypr/wayland/scanner
bin/hypr/wayland/protocols
{% endblock %}
