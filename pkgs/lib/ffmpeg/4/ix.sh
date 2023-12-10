{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/FFmpeg/FFmpeg/archive/refs/tags/n4.4.2.tar.gz
sha:2378c6ec0b0b7b4df4f87411afe72997e9d6803b1884398c1ef665c69e01eaea
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
lib/dav1d
lib/modplug
lib/xvidcore
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
wrap_cc
{% endblock %}

{% block configure_all_flags %}
--prefix=${out}
--enable-gpl
--enable-static
--disable-shared
{% block ffmpeg_programs %}
--disable-programs
{% endblock %}
--disable-stripping

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
--enable-libmodplug
{% endblock %}

{% block make_flags %}
CC=clang
CXX=clang++
{% endblock %}

{% block install %}
{{super()}}
mkdir -p ${out}/lib/cmake/FFmpeg
cat << EOF > ${out}/lib/cmake/FFmpeg/FFmpegConfig.cmake
set(ffmpeg_path "${out}")
set(prefix "\${ffmpeg_path}") 
set(exec_prefix "\${prefix}")
set(libdir "\${exec_prefix}/lib")
set(FFMPEG_PREFIX "\${ffmpeg_path}")
set(FFMPEG_EXEC_PREFIX "\${ffmpeg_path}")
set(FFMPEG_LIBDIR "\${exec_prefix}/lib")
set(FFMPEG_INCLUDE_DIRS "\${prefix}/include")
set(FFMPEG_LIBRARIES "-L\${FFMPEG_LIBDIR} -lavcodec -lavformat -lpostproc -lavdevice -lavresample -lswresample -lavfilter -lavutil")
string(STRIP "\${FFMPEG_LIBRARIES}" FFMPEG_LIBRARIES)
EOF
{% endblock %}
