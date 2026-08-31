{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
plutosvg
{% endblock %}

{% block version %}
0.0.8
{% endblock %}

{% block fetch %}
https://github.com/sammycage/plutosvg/archive/refs/tags/v{{self.version().strip()}}.tar.gz
49d5cfe772d3aa10cd4879f2f6e189f5083c08e4c8ea01bf3d5b87c97dfca7d2
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/freetype
lib/pluto/vg
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/plutosvg \${CPPFLAGS}"
export CMFLAGS="-Dplutosvg_INCLUDE_PATH=${out}/include \${CMFLAGS}"
{% endblock %}
