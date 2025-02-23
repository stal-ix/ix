{% extends '//lib/mpv/t/ix.sh' %}

{% block bld_libs %}
lib/lua
lib/mu/js
lib/opengl
lib/wayland
lib/blueray
lib/x265/dl
lib/xkb/common
lib/drivers/3d
lib/rubber/band
lib/vulkan/headers
{{super()}}
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/wayland
{% endblock %}

{% block meson_flags %}
{{super()}}
javascript=enabled
{% endblock %}
