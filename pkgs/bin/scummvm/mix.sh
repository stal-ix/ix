{% extends '//mix/autohell.sh' %}

{% block fetch %}
https://downloads.scummvm.org/frs/scummvm/2.5.1/scummvm-2.5.1.tar.xz
sha:9fd8db38e4456144bf8c34dacdf7f204e75f18e8e448ec01ce08ce826a035f01
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/a52
lib/c++
lib/png
lib/curl
lib/jpeg
lib/faad2
lib/sdl/2
lib/mpeg2
lib/giflib
lib/fribidi
lib/freetype
lib/timidity
lib/xiph/ogg
lib/xiph/flac
lib/xiph/vorbis

lib/drivers/3d
lib/mesa/gl/dl
lib/mesa/egl/dl
lib/mesa/glesv2/dl
{% endblock %}

{% block bld_tool %}
bin/nasm
# llvm-strings?
bin/elfutils
{% endblock %}

{% block c_rename_symbol %}
crc_finalize
{% endblock %}

{% block configure %}
sh ./configure \
    --prefix=${out}        \
    --enable-static        \
    --opengl-mode=gles2    \
    --enable-verbose-build \
    --force-opengl-game-es2
{% endblock %}

{% block patch %}
find. -type f | while read l; do
    sed -e 's|-lX11||g' -i ${l}
done
{% endblock %}
