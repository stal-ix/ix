{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
wf-shell
{% endblock %}

{% block version %}
0.11.0
{% endblock %}

{% block git_repo %}
https://github.com/WayfireWM/wf-shell
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
46c0bab3b37aa7a1896eae63529efaa3f8acd5e12e44662bd4421c1dc61482ac
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk/deps
lib/gtk/3/mm
lib/wf/config
lib/dbus/menu
lib/gtk/layer/shell/3
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
