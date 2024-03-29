{% extends '//die/c/meson.sh' %}

{% block git_repo %}
https://github.com/WayfireWM/wf-shell
{% endblock %}

{% block git_commit %}
c9639087aca3ad69bbd8f56f4213768639b4c8d0
{% endblock %}

{% block git_sha %}
1786797dbe28c1dd107ee478048c46a59dea98245ef2e57d0e5ed75c4de68b10
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
