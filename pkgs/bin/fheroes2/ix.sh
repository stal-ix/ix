{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
fheroes2
{% endblock %}

{% block version %}
1.1.9
{% endblock %}

{% block fetch %}
https://github.com/ihhub/fheroes2/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:b343f9737b9cf75846192db8defeda254b2184ff7dd83f674581fa10ce8f38ed
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
