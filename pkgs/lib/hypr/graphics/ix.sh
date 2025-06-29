{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
hyprgraphics
{% endblock %}

{% block version %}
0.1.4
{% endblock %}

{% block fetch %}
https://github.com/hyprwm/hyprgraphics/archive/refs/tags/v{{self.version().strip()}}.tar.gz
8b4662a0e687351da703a19e9cd9fdbe4b4b053e7380957584cda112c96feb9f
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
