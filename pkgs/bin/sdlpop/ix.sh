{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/NagyD/SDLPoP/archive/refs/tags/v1.23.tar.gz
sha:41a9aa64b4e8d0a9d7a84ffced48f74f9528d81adbffc08593ecf84776c5d77a
{% endblock %}

{% block unpack %}
{{super()}}
cd src
{% endblock %}

{% block bld_libs %}
lib/c
lib/sdl/2
lib/sdl/deps
lib/sdl/2/image
{% endblock %}

{% block cpp_includes %}
${SDL2_HEADERS}
{% endblock %}

{% block cpp_defines %}
_GNU_SOURCE=1
{% endblock %}

{% block cpp_missing %}
stdio.h
{% endblock %}

{% block c_rename_symbol %}
draw_image
{% endblock %}

{% block install %}
cd ..
mkdir ${out}/bin
cp prince ${out}/bin/
{% endblock %}
