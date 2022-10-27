{% extends '//die/c/waf.sh' %}

{% block fetch %}
https://github.com/mpv-player/mpv/archive/refs/tags/v0.34.1.tar.gz
sha:32ded8c13b6398310fa27767378193dc1db6d78b006b70dbcbd3123a1445e746
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
