{% extends '//die/c/meson.sh' %}

{% block git_repo %}
https://github.com/WayfireWM/wf-shell
{% endblock %}

{% block git_commit %}
c9639087aca3ad69bbd8f56f4213768639b4c8d0
{% endblock %}

{% block git_sha %}
3c5ccc00263eb81c9f1fe079f848d328a80fa619544b96d030a468f70251b7c8
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
