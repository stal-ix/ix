{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/Ferdi265/wl-mirror
{% endblock %}

{% block git_branch %}
v0.13.1
{% endblock %}

{% block git_sha %}
9fd65e8d852bd927a7349dfa6e85e15fbf2b8029e4a2b3a3c50d8d58597993d9
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
