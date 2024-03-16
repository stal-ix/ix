{% extends '//die/c/configure.sh' %}

{% block fetch %}
https://downloads.scummvm.org/frs/scummvm/2.8.1/scummvm-2.8.1.tar.xz
sha:7e97f4a13d22d570b70c9b357c941999be71deb9186039c87d82bbd9c20727b7
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/a52
lib/c++
lib/png
lib/mad
lib/gif
lib/curl
lib/jpeg
lib/faad2
lib/sdl/2
lib/mpeg2
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
bld/nasm
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
