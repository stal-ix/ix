{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
fheroes2
{% endblock %}

{% block version %}
1.1.17
{% endblock %}

{% block fetch %}
https://github.com/ihhub/fheroes2/archive/refs/tags/{{self.version().strip()}}.tar.gz
29f0be1a15ecce658e647b8c3d3fe2e6acddf6fa2144b1e05c82984846f568a1
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/png
lib/sdl/2
lib/sdl/deps
lib/sdl/2/mixer
lib/sdl/2/image
# {{opengl | defined('opengl')}}
{% endblock %}

{% block bld_tool %}
bld/make
bin/iconv
bld/gettext
{% endblock %}
