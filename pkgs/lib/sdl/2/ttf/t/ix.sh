{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libsdl-org/SDL_ttf/archive/refs/tags/release-2.22.0.tar.gz
sha:2275d0ddfffa53f0efa628bc1621f662dacbd42467b5a44db99e38255fbb575a
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
