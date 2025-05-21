{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
plutosvg
{% endblock %}

{% block version %}
0.0.7
{% endblock %}

{% block fetch %}
https://github.com/sammycage/plutosvg/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:78561b571ac224030cdc450ca2986b4de915c2ba7616004a6d71a379bffd15f3
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
