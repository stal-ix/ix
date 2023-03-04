{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/libsdl-org/SDL_mixer/archive/refs/tags/release-2.6.3.tar.gz
sha:91dd065e9e63f499e5317350b110184b0ba96bc5f63c39b3a9939a136c40c035
{% endblock %}

{% block lib_deps %}
lib/c
lib/sdl/2
lib/mpg123
lib/mikmod
lib/modplug
lib/xiph/ogg
lib/xiph/flac
lib/opus/file
lib/xiph/vorbis
{% endblock %}

{% block configure_flags %}
--disable-music-mod-modplug-shared
--disable-music-mod-xmp-shared
--disable-music-midi-fluidsynth-shared
--disable-music-ogg-vorbis-shared
--disable-music-ogg-tremor-shared
--disable-music-flac-libflac-shared
--disable-music-mp3-mpg123-shared
--disable-music-opus-shared
{% endblock %}
