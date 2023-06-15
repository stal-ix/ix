{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/OpenTTD/OpenTTD/archive/refs/tags/13.3.tar.gz
sha:a1b4a75a188c1dc132abbca4bb26badf3cdc092eff29ec90a613dd8b20b69916
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
