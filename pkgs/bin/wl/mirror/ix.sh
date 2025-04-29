{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
wl-mirror
{% endblock %}

{% block version %}
0.18.1
{% endblock %}

{% block git_repo %}
https://github.com/Ferdi265/wl-mirror
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
8df2aea13e35efdd528c3234fecf99f46d2a5ae74e4f92798e369d0884160544
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
