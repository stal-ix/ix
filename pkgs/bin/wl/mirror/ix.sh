{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/Ferdi265/wl-mirror
{% endblock %}

{% block git_branch %}
v0.13.1
{% endblock %}

{% block git_sha %}
8e756f97728fa3eda591e70dcfa72e78d0bacef6442a43753c47c7f4af991528
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
