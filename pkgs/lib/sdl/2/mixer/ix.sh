{% extends '//die/autohell.sh' %}

{% block fetch %}
#https://www.libsdl.org/projects/SDL_mixer/release/SDL2_mixer-2.0.4.tar.gz
#sha:b4cf5a382c061cd75081cf246c2aa2f9df8db04bdda8dcdc6b6cca55bede2419
https://github.com/libsdl-org/SDL_mixer/archive/refs/tags/release-2.6.0.tar.gz
sha:590dbcc8d738337344d77e8d837fbc648c52f3aff076ef2b007537f886a92809
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
