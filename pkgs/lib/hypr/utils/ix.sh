{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/hyprwm/hyprutils/archive/refs/tags/v0.5.2.tar.gz
sha:b30b93be9597489bd5a29c8cd91d60ea0fcaea08fd03cca1368e101c4ae19d3d
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
