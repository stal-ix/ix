{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
wf-shell
{% endblock %}

{% block version %}
0.10.0
{% endblock %}

{% block git_repo %}
https://github.com/WayfireWM/wf-shell
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
b3af12d8a07f15d77abd66746e10899fb21e2875be7d33774e2a6bd4f15c8105
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
