{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
wf-shell
{% endblock %}

{% block version %}
0.9.0
{% endblock %}

{% block git_repo %}
https://github.com/WayfireWM/wf-shell
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
5a76cc4a1bd8cdb433945acb312cd10d91f38869cc6e723a3758660ac3421548
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
