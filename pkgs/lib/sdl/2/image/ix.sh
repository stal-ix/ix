{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libsdl-org/SDL_image/archive/refs/tags/release-2.8.0.tar.gz
sha:fce636dcf2570f68d8adbc2dd13567ab42aff5fde785ca57490ee2d2ff131e89
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
