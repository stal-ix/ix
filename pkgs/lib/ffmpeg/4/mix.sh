{% extends '//mix/autohell.sh' %}

{% block fetch %}
https://ffmpeg.org/releases/ffmpeg-4.4.2.tar.xz
sha:af419a7f88adbc56c758ab19b4c708afbcae15ef09606b82b855291f6a6faa93
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/xz
lib/aom
lib/vpx
lib/opus
lib/webp
lib/x264
lib/x265
lib/xvid
lib/dav1d
lib/openh264
lib/jpeg/open
lib/xiph/speex
lib/xiph/vorbis
lib/xiph/theora
{% endblock %}

{% block bld_tool %}
bin/nasm
bld/perl
bld/cmake
bld/pkg/config
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block configure_all_flags %}
--prefix=${out}
--enable-gpl
--enable-static
--disable-shared
--disable-programs

--enable-libaom
--enable-libdav1d
--enable-libopenh264
--enable-libopenjpeg
--enable-libopus
--enable-libvorbis
--enable-libvpx
--enable-libwebp
--enable-libx264
--enable-libx265
--enable-libxvid
--enable-libspeex
--enable-libtheora
{% endblock %}
