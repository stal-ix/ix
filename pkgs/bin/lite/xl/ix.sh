{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/lite-xl/lite-xl/archive/refs/tags/v2.1.0.tar.gz
sha:761d390d0ef2706eeed1c685211d8ff5ce63dacd51d561e56c7e0f7ec0e7ea62
{% endblock %}

{% block bld_libs %}
lib/c
lib/sdl/2
lib/pcre/2
lib/sdl/deps
lib/freetype
lib/lua/puc/5/4
{% endblock %}

{% block meson_flags %}
renderer=true
{% endblock %}
