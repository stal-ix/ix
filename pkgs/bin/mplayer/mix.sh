{% extends '//mix/autohell.sh' %}

{% block fetch %}
https://mplayerhq.hu/MPlayer/releases/MPlayer-1.5.tar.xz
sha:650cd55bb3cb44c9b39ce36dac488428559799c5f18d16d98edb2b7256cbbf85
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/a52
lib/mad
lib/png
lib/faad2
lib/mpeg2
lib/sdl/1
lib/linux
lib/mpg123
lib/ffmpeg
lib/giflib
lib/curses
lib/fribidi
lib/freetype
lib/sdl/deps
lib/fontconfig
{% endblock %}

{% block bld_tool %}
bin/yasm
{% endblock %}

{% block configure_all_flags %}
--disable-ffmpeg_a
--enable-runtime-cpudetection
--prefix=${out}
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
