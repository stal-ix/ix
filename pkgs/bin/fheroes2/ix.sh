{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ihhub/fheroes2/archive/refs/tags/0.9.20.tar.gz
sha:0d9694f552619fd274e1a0c740c1ecbfa32c8bda661200495e29234e9c13b574
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
