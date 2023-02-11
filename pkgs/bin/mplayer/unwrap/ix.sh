{% extends '//die/c/configure.sh' %}

{#libmpcodecs/ve_raw.c:166:19: error: incompatible function pointer types assigning to 'int (*)(struct vf_instance *, mp_image_t *, double, double)' (aka 'int (*)(struct vf_instance *, struct mp_image *, double, double)') from 'int (struct vf_instance *, mp_image_t *, double)' (aka 'int (struct vf_instance *, struct mp_image *, double)') [-Wincompatible-function-pointer-types] vf->put_image = put_image;#}

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
lib/faac
lib/faad2
lib/mpeg2
lib/sdl/1
lib/kernel
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
--disable-ossaudio
--enable-runtime-cpudetection
--prefix=${out}
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
