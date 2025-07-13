{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
hyprgraphics
{% endblock %}

{% block version %}
0.1.5
{% endblock %}

{% block fetch %}
https://github.com/hyprwm/hyprgraphics/archive/refs/tags/v{{self.version().strip()}}.tar.gz
03bdd5a6e456c31cc17f973656326220f94e58a5f4ab33b2450ccb5d6a697a4c
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/jxl
lib/jpeg
lib/webp
lib/spng
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
