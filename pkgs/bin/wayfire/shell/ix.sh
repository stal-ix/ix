{% extends '//die/c/meson.sh' %}

{% block git_repo %}
https://github.com/WayfireWM/wf-shell
{% endblock %}

{% block git_commit %}
c9639087aca3ad69bbd8f56f4213768639b4c8d0
{% endblock %}

{% block git_sha %}
21056561118a3c66466925a8da67715f09ee936a9c35a311fb8c7891e9d813e5
{% endblock %}

{% block git_version %}
v3
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk/3/mm
lib/wf/config
lib/gtk/layer/shell
{% endblock %}

{% block patch %}
sed -e 's|.*dep.*wayfire.*||' -i meson.build
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}

{% block meson_flags %}
pulse=disabled
wayland-logout=false
{% endblock %}
