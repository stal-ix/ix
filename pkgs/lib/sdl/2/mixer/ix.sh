{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/libsdl-org/SDL_mixer/archive/refs/tags/release-2.6.2.tar.gz
sha:30c64e23506fcb1699981a297833407bf5bf9d8ab77390e26b26117b4a58bad5
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
