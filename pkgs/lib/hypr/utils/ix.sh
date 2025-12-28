{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
hyprutils
{% endblock %}

{% block version %}
0.11.0
{% endblock %}

{% block fetch %}
https://github.com/hyprwm/hyprutils/archive/refs/tags/v{{self.version().strip()}}.tar.gz
1f097eb9915081f1b929973701643bcd8581b469c242eae5446275b120a3b229
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
