{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
SDL_mixer
{% endblock %}

{% block version %}
2.8.1
{% endblock %}

{% block fetch %}
https://github.com/libsdl-org/SDL_mixer/archive/refs/tags/release-{{self.version().strip()}}.tar.gz
63804b4b2ba503865c0853f102231aeff489b1dfc6dea4750a69e2a8ef54b2bb
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

{% block step_install %}
{{super()}}
test -f ${out}/lib/pkgconfig/SDL2_mixer.pc
find ${out}/lib/cmake -type f | while read l; do
    sed -e 's|-2\.0\.a|\.a|g' \
        -e 's|.*INTERFACE_SDL2_SHARED.*||' \
        -i ${l}
done
{% endblock %}
