{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/Ferdi265/wl-mirror
{% endblock %}

{% block git_branch %}
v0.13.1
{% endblock %}

{% block git_sha %}
3482d091f1dd6cacf0572681addc69bdcb90123cc03aed851cfd9afa97af3686
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
