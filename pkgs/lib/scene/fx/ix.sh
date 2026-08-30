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
