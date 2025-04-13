{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
fheroes2
{% endblock %}

{% block version %}
1.1.7
{% endblock %}

{% block fetch %}
https://github.com/ihhub/fheroes2/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:6419ad0bd0f1f684a9256c39fb6c02a026fc76581b0bc9632a597fbc8443fc03
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
