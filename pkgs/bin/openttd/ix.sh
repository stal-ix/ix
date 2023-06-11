{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/OpenTTD/OpenTTD/archive/refs/tags/13.2.1.tar.gz
sha:3dd19deeeb8a83723ffd74aa1d5a7cf79c3e8b300376b123e2d9b1f6bf4c0c22
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
