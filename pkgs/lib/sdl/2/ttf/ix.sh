{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libsdl-org/SDL_ttf/archive/refs/tags/release-2.20.2.tar.gz
sha:0fe9d587cdc4e6754b647536d0803bea8ca6ac77146c4209e0bed22391cf8241
{% endblock %}

{% block lib_deps %}
lib/c
lib/sdl/2
lib/freetype
lib/harfbuzz
{% endblock %}

{% block cmake_flags %}
SDL2TTF_HARFBUZZ=ON
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/obj/glfont ${out}/bin/
cp ${tmp}/obj/showfont ${out}/bin/
{% endblock %}
