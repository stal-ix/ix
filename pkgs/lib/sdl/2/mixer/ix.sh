{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libsdl-org/SDL_mixer/archive/refs/tags/release-2.8.0.tar.gz
sha:1146f00815c8ad22c3d48fbe31ae23dc5997936ebf30b4b3aeab6eab7ea1db3e
{% endblock %}

{% block lib_deps %}
lib/c
lib/xmp
lib/sdl/2
lib/mpg123
lib/mikmod
lib/modplug
lib/wav/pack
lib/xiph/ogg
lib/xiph/flac
lib/opus/file
lib/xiph/vorbis
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block cmake_flags %}
SDL2MIXER_CMD=OFF
BUILD_SHARED_LIBS=ON
CMAKE_INSTALL_LIBDIR=lib
CMAKE_INSTALL_INCLUDEDIR=include
SDL2MIXER_BUILD_SHARED_LIBS=ON
SDL2MIXER_BUILD_STATIC_LIBS=OFf
SDL2MIXER_DEPS_SHARED=OFF
SDL2MIXER_MIDI_FLUIDSYNTH=OFF
SDL2MIXER_MP3_MPG123=ON
SDL2MIXER_OPUS_SHARED=OFF
SDL2MIXER_SAMPLES=OFF
SDL2MIXER_VORBIS=VORBISFILE
SDL2MIXER_VORBIS_VORBISFILE_SHARED=OFF
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
cp libSDL2_mixer.so libSDL2_mixer.a
{% endblock %}

{% block test %}
test -f ${out}/lib/pkgconfig/SDL2_mixer.pc
{% endblock %}
