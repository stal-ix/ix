{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
SDL_ttf
{% endblock %}

{% block version %}
3.2.2
{% endblock %}

{% block fetch %}
https://github.com/libsdl-org/SDL_ttf/archive/refs/tags/release-{{self.version().strip()}}.tar.gz
sha:ff6b81d3dc39d843cc3ead6dedd68043a79513d266792ea89445547ef4e9b073
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
