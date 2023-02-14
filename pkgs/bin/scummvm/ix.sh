{% extends '//die/c/configure.sh' %}

{% block fetch %}
https://downloads.scummvm.org/frs/scummvm/2.7.0/scummvm-2.7.0.tar.xz
sha:444b1ffd61774fe867824e57bb3033c9998ffa8a4ed3a13246b01611d5cf9993
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/a52
lib/c++
lib/png
lib/mad
lib/curl
lib/jpeg
lib/faad2
lib/sdl/2
lib/mpeg2
lib/giflib
lib/fribidi
lib/sdl/deps
lib/freetype
lib/timidity
lib/shim/x11
lib/xiph/ogg
lib/xiph/flac
lib/xiph/vorbis
lib/xiph/theora
{% endblock %}

{% block bld_tool %}
bin/nasm
bld/fakegit
bld/elfutils
{% endblock %}

{% block c_rename_symbol %}
crc_finalize
{% endblock %}

{% block configure_all_flags %}
--prefix=${out}
--enable-static
--opengl-mode=gles2
--enable-verbose-build
{% endblock %}
