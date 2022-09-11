{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ihhub/fheroes2/archive/refs/tags/0.9.19.tar.gz
sha:dffdf0032ca38fd0a88f5125a64a9fb0b998b234d9c6c15ac81513bfd6c2f79a
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
