{% extends '//die/c/meson.sh' %}

{% block git_repo %}
https://github.com/hyprwm/Hyprland
{% endblock %}

{% block git_branch %}
v0.27.0
{% endblock %}

{% block git_sha %}
fa1c5386115b6c3a38b0fd09619162ad1340d8a255c8e2413ee8128af9ce67ab
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/pango
lib/cairo
lib/input
lib/udis86
lib/opengl
lib/wayland
lib/shim/x11
lib/xkbcommon
lib/drivers/3d
lib/wlroots/17
lib/mesa/gl/dl
lib/mesa/egl/dl
lib/range/v3/std
lib/mesa/glesv2/dl
{% endblock %}

{% block bld_tool %}
bin/jq
bld/fakegit
bld/wayland
{% endblock %}

{% block patch %}
sed -e 's|.*define PI .*||' -i src/defines.hpp
sed -e 's|PI |M_PI |g' -i src/config/ConfigManager.cpp
sed -e 's|PI |M_PI |g' -i src/render/OpenGL.cpp

sed -e "s|subproject.*wlroots.*|dependency('wlroots')|" \
    -e 's|have_xwlr = .*|have_xwlr = false|' \
    -i meson.build

sed -e 's|.get_variable.*wlroots.*|,|' \
    -i src/meson.build
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block install %}
{{super()}}
rm -rf ${out}/share/pkgconfig
{% endblock %}
