{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
hyprutils
{% endblock %}

{% block version %}
0.8.2
{% endblock %}

{% block fetch %}
https://github.com/hyprwm/hyprutils/archive/refs/tags/v{{self.version().strip()}}.tar.gz
932f8b0023edcbfd01106c634010cad1533dccf295c2817d66da0e455e12753a
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/pixman
{% endblock %}

{% block bld_tool %}
bld/prepend
{% endblock %}

{% block patch %}
prepend include/hyprutils/animation/AnimationConfig.hpp << EOF
#include <string>
EOF
{% endblock %}
