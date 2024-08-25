{% extends '//die/c/meson.sh' %}

{% block git_repo %}
https://github.com/WayfireWM/wf-shell
{% endblock %}

{% block git_branch %}
v0.9.0
{% endblock %}

{% block git_sha %}
4fa64a152d3964f1b666ee213181d4486c3244bd8352795d6c27a3bebb7de602
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk/deps
lib/gtk/3/mm
lib/wf/config
lib/dbus/menu
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
