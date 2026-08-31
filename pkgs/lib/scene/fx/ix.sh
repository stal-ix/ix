{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
scenefx
{% endblock %}

{% block version %}
0.5
{% endblock %}

{% block fetch %}
https://github.com/wlrfx/scenefx/archive/refs/tags/{{self.version().strip()}}.tar.gz
0fa8ecca0e310f813efd052624c5ed7d9153d6a0fdead5cc957d34c07f9a86c6
{% endblock %}

{% block lib_deps %}
lib/wlroots/20(opengl=1)
lib/opengl
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}

{% block patch %}
sed -e 's/__always_inline/inline/g' -i \
    include/scenefx/types/fx/clipped_region.h \
    include/types/fx/clipped_region.h
{% endblock %}

{% block c_rename_symbol %}
buffer_is_opaque
matrix_projection
matrix_invert
output_pending_resolution
output_pending_image_description
wlr_matrix_identity
wlr_matrix_multiply
wlr_matrix_translate
wlr_matrix_scale
wlr_matrix_transform
wlr_matrix_project_box
{% endblock %}
