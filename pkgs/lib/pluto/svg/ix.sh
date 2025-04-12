{% extends '//die/c/meson.sh' %}

{% block version %}
0.0.5
{% endblock %}

{% block fetch %}
https://github.com/sammycage/plutosvg/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:b82fa5e361d841a8c1c3471060d9b87148169d5401592c23be5084cfb3b825b5
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
