{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
hyprutils
{% endblock %}

{% block version %}
0.6.0
{% endblock %}

{% block fetch %}
https://github.com/hyprwm/hyprutils/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:1c113058881121fdb2575573ed9a59d78dbdf1ae2ae95c6dac647e608548263b
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
