{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/libsdl-org/SDL_image/archive/refs/tags/release-2.6.2.tar.gz
sha:5d91ea72b449a161821ef51464d0767efb6fedf7a773f923c43e483dc137e362
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
