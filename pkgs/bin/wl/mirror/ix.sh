{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
wl-mirror
{% endblock %}

{% block version %}
0.18.5
{% endblock %}

{% block git_repo %}
https://github.com/Ferdi265/wl-mirror
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
1aa99a192c02f41858f7a72405e8500a71d2a7a9f72fdfb1411efebab9a914d2
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
