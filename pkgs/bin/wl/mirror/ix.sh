{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/Ferdi265/wl-mirror
{% endblock %}

{% block git_branch %}
v0.17.0
{% endblock %}

{% block git_sha %}
34439022a11c7dead96ea05cccddcbe2afb351ec0b7f256cbfc45c69f300ed77
{% endblock %}

{% block bld_libs %}
lib/c
lib/opengl
lib/wayland
lib/drivers/3d
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}
