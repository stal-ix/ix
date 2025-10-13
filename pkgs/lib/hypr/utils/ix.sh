{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
hyprutils
{% endblock %}

{% block version %}
0.10.0
{% endblock %}

{% block fetch %}
https://github.com/hyprwm/hyprutils/archive/refs/tags/v{{self.version().strip()}}.tar.gz
0e2d2495166e314a4ef52d97bcae6f82ee10a1247a60e42b2087d876a7563b0c
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
