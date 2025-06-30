{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
hyprutils
{% endblock %}

{% block version %}
0.8.0
{% endblock %}

{% block fetch %}
https://github.com/hyprwm/hyprutils/archive/refs/tags/v{{self.version().strip()}}.tar.gz
7866a94468140ecdedfeacc280910ed13dffe8a6a9c0e3472a618126c9b8aab4
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
