{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/hyprwm/Hyprland/releases/download/v0.24.1/source-v0.24.1.tar.gz
sha:91725f5b2382ffa53bed02d61efde5216290073fb2aff6bb414da3c0cd66ef36
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
