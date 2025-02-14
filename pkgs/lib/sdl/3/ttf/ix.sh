{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libsdl-org/SDL_ttf/archive/refs/tags/preview-3.1.0.tar.gz
sha:2e4e28a098bd2a6dda85d3de5d1edb440af66f8e4d4e5d3be30a3a8628583699
{% endblock %}

{% block lib_deps %}
lib/c
lib/sdl/3
lib/freetype
lib/harfbuzz
lib/pluto/svg
{% endblock %}

{% block cmake_flags %}
SDLTTF_SAMPLES=OFF
SDLTTF_INSTALL=ON
SDLTTF_VENDORED=OFF
{% endblock %}
