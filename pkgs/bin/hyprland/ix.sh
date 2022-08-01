{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/hyprwm/Hyprland/archive/refs/tags/v0.9.0beta.tar.gz
sha:3027593887bb4247196b0cb5a6e803e6dbbbc3f725e0fdbecc904596a05c02ac
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/pango
lib/cairo
lib/input
lib/wayland
lib/wlroots
lib/xkbcommon
lib/mesa/gl/dl
lib/mesa/egl/dl
lib/mesa/glesv2/dl
{% endblock %}

{% block bld_tool %}
bld/make
bld/wayland
{% endblock %}

{% block patch %}
sed -e 's|.*X11.*||' -i src/includes.hpp
sed -e 's| xcb||' -i CMakeLists.txt
{% endblock %}

{% block cmake_flags %}
NO_XWAYLAND=ON
{% endblock %}

{% block build %}
make ext-workspace-unstable-v1-protocol.o
{{super()}}
{% endblock %}
