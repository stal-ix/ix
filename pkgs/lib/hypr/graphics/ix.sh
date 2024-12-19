{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/hyprwm/hyprgraphics/archive/refs/tags/v0.1.1.tar.gz
sha:123a29e53a00bfaf37e7971b929433fb716fd497b3555f72c2d0419ae18e65c7
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/png
lib/jxl
lib/jpeg
lib/webp
lib/magic
lib/cairo
lib/pixman
lib/hypr/utils
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block bld_tool %}
bld/prepend
{% endblock %}

{% block patch %}
prepend src/color/Color.cpp << EOF
#include <algorithm>
EOF
{% endblock %}
