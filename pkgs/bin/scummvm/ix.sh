{% extends '//die/c/configure.sh' %}

{% block fetch %}
https://downloads.scummvm.org/frs/scummvm/2.6.1/scummvm-2.6.1.tar.xz
sha:8fafb9efabdd1bf8adfe39eeec3fc80b22de30ceddd1fadcde180e356cd317e9
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
