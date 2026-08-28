{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
hyprgraphics
{% endblock %}

{% block version %}
0.5.1
{% endblock %}

{% block fetch %}
https://github.com/hyprwm/hyprgraphics/archive/refs/tags/v{{self.version().strip()}}.tar.gz
861ecaad872835922dd5745a612d7a4cc7bfc4babb1d06bc92bc63c2ac013b74
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
lib/drm
lib/pango
lib/opengl
lib/hypr/utils
{% endblock %}

{% block bld_libs %}
lib/hypr/rsvg
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
