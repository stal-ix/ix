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
lib/glu
lib/sdl/2
lib/sdl/deps
lib/freetype
lib/fontconfig
lib/drivers/3d
lib/shim/fake(lib_name=OpenGL)
{% endblock %}

{% block cmake_flags %}
OPTION_USE_THREADS=OFF
{% endblock %}

{% block bld_tool %}
# for man
bin/gzip
{% endblock %}
