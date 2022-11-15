{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/hyprwm/Hyprland/releases/download/v0.12.1beta/source-v0.12.1beta.tar.gz
sha:be9220878e65e1fbf1ff7e9b4d6c3f4c3386198b458f78cc874576fdb8f65e7a
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/pango
lib/cairo
lib/input
lib/opengl
lib/wayland
lib/xkbcommon
lib/wlroots/15
lib/mesa/gl/dl
lib/mesa/egl/dl
lib/mesa/glesv2/dl
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}
