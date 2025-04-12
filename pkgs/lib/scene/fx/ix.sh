{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
scenefx
{% endblock %}

{% block version %}
0.1
{% endblock %}

{% block fetch %}
https://github.com/wlrfx/scenefx/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:f5c889f4c826a4216628bf1e7e48071fc33e7774b5e3d51e6fee6e571e420827
{% endblock %}

{% block lib_deps %}
lib/wlroots/17
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}

{% block c_rename_symbol %}
buffer_is_opaque
matrix_projection
output_pending_resolution
{% endblock %}
