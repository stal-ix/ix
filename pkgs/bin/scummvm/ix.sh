{% extends '//die/c/configure.sh' %}

{% block fetch %}
https://downloads.scummvm.org/frs/scummvm/2.6.0/scummvm-2.6.0.tar.xz
sha:1c1438e8d0c9d9e15fd129e2e9e2d2227715bd7559f83b2e7208f5d8704ffc17
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
bld/elfutils
bld/scripts/fakegit
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
