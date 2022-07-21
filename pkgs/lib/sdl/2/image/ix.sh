{% extends '//die/c/autohell.sh' %}

{% block fetch %}
#https://www.libsdl.org/projects/SDL_image/release/SDL2_image-2.0.5.tar.gz
#sha:bdd5f6e026682f7d7e1be0b6051b209da2f402a2dd8bd1c4bd9c25ad263108d0
https://github.com/libsdl-org/SDL_image/archive/refs/tags/release-2.6.0.tar.gz
sha:fb61d96446cdb1668f837dd7ba1d22d6631755d5dda86580a1cb5aefa3e62278
{% endblock %}

{% block lib_deps %}
lib/c
lib/jxl
lib/png
lib/jpeg
lib/tiff
lib/avif
lib/sdl/2
{% endblock %}
