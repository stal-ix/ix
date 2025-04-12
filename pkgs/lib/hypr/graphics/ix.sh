{% extends '//die/c/cmake.sh' %}

{% block version %}
0.1.3
{% endblock %}

{% block fetch %}
https://github.com/hyprwm/hyprgraphics/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:0e11457135a9e7160cf147d361fae3c5dc40035a4ebd894c5d409baa896f43cf
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
