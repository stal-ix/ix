{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
wl-mirror
{% endblock %}

{% block version %}
0.18.3
{% endblock %}

{% block git_repo %}
https://github.com/Ferdi265/wl-mirror
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
21e8727f2af7b8a948cf719602305783f426a12dff4365be09bcb88d28693ffe
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
