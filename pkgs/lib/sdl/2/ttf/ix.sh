{% extends '//die/c/cmake.sh' %}

{% block fetch %}
#https://github.com/libsdl-org/SDL_ttf/archive/refs/tags/release-2.0.18.tar.gz
#sha:6b61544441b72bdfa1ced89034c6396fe80228eff201eb72c5f78e500bb80bd0
https://github.com/libsdl-org/SDL_ttf/archive/refs/tags/release-2.20.0.tar.gz
sha:3b3ec3e00dcfd188f572b50daa74b1cb8f40120ab094ce3d9e289705fd178183
{% endblock %}

{% block lib_deps %}
lib/c
lib/sdl/2
lib/freetype
lib/harfbuzz
{% endblock %}
