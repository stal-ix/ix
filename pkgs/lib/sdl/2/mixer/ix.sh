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
lib/xiph/ogg
lib/xiph/flac
lib/opus/file
lib/xiph/vorbis
{% endblock %}
