{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/ihhub/fheroes2/archive/refs/tags/0.9.13.tar.gz
sha:f46479783511d2c244778e558a624db164102cedb6116419fed97ec862f9505d
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
