{% extends '//die/c/cmake.sh' %}

{% block version %}
3.2.0
{% endblock %}

{% block fetch %}
https://github.com/libsdl-org/SDL_ttf/archive/refs/tags/release-{{self.version().strip()}}.tar.gz
sha:b0d6d470822b23b6028dd26022ded8b25afe5caa9a2c431dce7259c1bcb232e0
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
BUILD_SHARED_LIBS=ON
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
