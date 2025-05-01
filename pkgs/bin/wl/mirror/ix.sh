{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
wl-mirror
{% endblock %}

{% block version %}
0.18.2
{% endblock %}

{% block git_repo %}
https://github.com/Ferdi265/wl-mirror
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
6d8b2c7ab6a6fd3103eaa66aebef702477e2a8ab520c1ec581db51c297343039
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
