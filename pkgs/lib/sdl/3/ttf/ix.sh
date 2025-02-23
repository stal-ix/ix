{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libsdl-org/SDL_ttf/archive/refs/tags/prerelease-3.1.2.tar.gz
sha:431056229fcde692427fa7ec432291dd5cc0559fdf2a48f1249764e3cb863182
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
