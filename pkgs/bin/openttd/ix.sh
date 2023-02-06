{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/OpenTTD/OpenTTD/archive/refs/tags/13.0.tar.gz
sha:36bc7e290c690d250354c70f9223e0504096210486be0d1bf188c74709439cda
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/xz
lib/c++
lib/png
lib/lzo
lib/icu
lib/sdl/2
lib/sdl/deps
lib/freetype
lib/fontconfig
{% endblock %}

{% block bld_tool %}
# for man
bin/gzip
{% endblock %}
