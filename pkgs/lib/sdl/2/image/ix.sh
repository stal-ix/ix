{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libsdl-org/SDL_image/archive/refs/tags/release-2.6.2.tar.gz
sha:5d91ea72b449a161821ef51464d0767efb6fedf7a773f923c43e483dc137e362
{% endblock %}

{% block lib_deps %}
lib/c
lib/jxl
lib/png
lib/webp
lib/jpeg
lib/tiff
lib/avif
lib/sdl/2
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block cmake_flags %}
BUILD_SHARED_LIBS=ON
CMAKE_INSTALL_LIBDIR=lib
CMAKE_INSTALL_INCLUDEDIR=include
SDL2IMAGE_BUILD_SHARED_LIBS=ON
SDL2IMAGE_DEPS_SHARED=OFF
SDL2IMAGE_SAMPLES=OFF
SDL2IMAGE_WEBP=ON
SDL2IMAGE_AVIF=ON
{% endblock %}

{% block patch %}
sed -e 's|0.9.1|1.0.0|' -i CMakeLists.txt
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
cp libSDL2_image.so libSDL2_image.a
{% endblock %}

{% block test %}
test -f ${out}/lib/pkgconfig/SDL2_image.pc
{% endblock %}
