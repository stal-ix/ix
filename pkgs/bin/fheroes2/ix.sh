{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
fheroes2
{% endblock %}

{% block version %}
1.1.11
{% endblock %}

{% block fetch %}
https://github.com/ihhub/fheroes2/archive/refs/tags/{{self.version().strip()}}.tar.gz
e9a70f4cc831231010354cc599c84b626a18e15de1252bc35e4ced720857236c
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
