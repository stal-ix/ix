{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
fheroes2
{% endblock %}

{% block version %}
1.1.8
{% endblock %}

{% block fetch %}
https://github.com/ihhub/fheroes2/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:a1a0fd0289f7a95a65ca15b967056ecfaec574621ad288f05fceb52d237e49d4
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
