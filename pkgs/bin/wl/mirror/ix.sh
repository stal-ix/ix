{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/Ferdi265/wl-mirror
{% endblock %}

{% block git_branch %}
v0.18.0
{% endblock %}

{% block git_sha %}
864b63d765717c2779822727acac7b0930018482eb5cd4c028838e03b6015ff7
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
