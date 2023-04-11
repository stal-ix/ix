{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/OpenTTD/OpenTTD/archive/refs/tags/13.1.tar.gz
sha:5740a4e7a76b841e35288c5fd2bb8b2659f5d9c5339223a2d857ee0e8fdc052c
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
