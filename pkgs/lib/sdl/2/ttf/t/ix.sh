{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
SDL_ttf
{% endblock %}

{% block version %}
2.24.0
{% endblock %}

{% block fetch %}
https://github.com/libsdl-org/SDL_ttf/archive/refs/tags/release-{{self.version().strip()}}.tar.gz
2c45241a56203a59d66ec6b4eae9457e5675fc609376566a257391fd29d341a2
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
