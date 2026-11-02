{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
hyprgraphics
{% endblock %}

{% block version %}
0.6.0
{% endblock %}

{% block fetch %}
https://github.com/hyprwm/hyprgraphics/archive/refs/tags/v{{self.version().strip()}}.tar.gz
27e9e19ff59ba75a2963d72c3dcb5c0840b266b90d7fca6d5df7cac105419b08
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
