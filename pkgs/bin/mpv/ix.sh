{% extends '//die/c/waf.sh' %}

{% block fetch %}
https://github.com/mpv-player/mpv/archive/refs/tags/v0.35.0.tar.gz
sha:dc411c899a64548250c142bf1fa1aa7528f1b4398a24c86b816093999049ec00
{% endblock %}

{% block bld_libs %}
lib/c
lib/lua
lib/ass
lib/zimg
lib/mu/js
lib/ffmpeg
lib/openal
lib/archive
lib/wayland
lib/mesa/gl
lib/mesa/egl
lib/uchardet
lib/placebo/4
lib/xkbcommon
lib/drivers/3d
lib/vulkan/headers
{% endblock %}

{% block bld_tool %}
bin/waf
bld/perl
bld/wayland
{% endblock %}

{% block waf_flags %}
--enable-openal
--enable-javascript
{% endblock %}
