{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/libsdl-org/SDL_mixer/archive/refs/tags/release-2.6.1.tar.gz
sha:8c7193d3b6ae8d44f4436e53b26735b02f6cceb70fb1a3ae3f44ebd0c965e0a6
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
