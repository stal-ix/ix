{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
plutosvg
{% endblock %}

{% block version %}
0.0.6
{% endblock %}

{% block fetch %}
https://github.com/sammycage/plutosvg/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:01f8aee511bd587a602a166642a96522cc9522efd1e38c2d00e4fbc0aa22d7a0
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
