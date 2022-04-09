{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/ihhub/fheroes2/archive/refs/tags/0.9.14.tar.gz
sha:5532fa8443b8d8f54fcfc56628f1020470ad215e12285d78c8450e49ea9944be
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
