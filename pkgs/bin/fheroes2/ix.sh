{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ihhub/fheroes2/archive/refs/tags/1.0.4.tar.gz
sha:2fe965fcd069618c0bf4e31a560d90345f4854feec0b36a785c3417dcd7e05d1
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/png
lib/sdl/2
lib/sdl/deps
lib/sdl/2/mixer
lib/sdl/2/image
{% endblock %}

{% block bld_tool %}
bld/make
bin/iconv
bld/gettext
{% endblock %}
