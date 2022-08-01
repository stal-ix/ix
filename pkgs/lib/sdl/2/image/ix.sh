{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/libsdl-org/SDL_image/archive/refs/tags/release-2.6.1.tar.gz
sha:460da7fcee5302fdcc20ee0c26ad1c8d48810d2e368e73d564daf267344780f9
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
