{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libsdl-org/SDL_ttf/archive/refs/tags/release-2.20.1.tar.gz
sha:520bb84423dc705164781b6f00d81e7016fbdd884b2bd2b2f24335269a0130a7
{% endblock %}

{% block lib_deps %}
lib/c
lib/sdl/2
lib/freetype
lib/harfbuzz
{% endblock %}
