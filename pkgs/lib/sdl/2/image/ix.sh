{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libsdl-org/SDL_image/archive/refs/tags/release-2.8.1.tar.gz
sha:2162abce9e4edb62267e0db5c2886058f0a16020a468eccc06d006df96ca972f
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
test -f ${out}/lib/pkgconfig/SDL2_image.pc
{% endblock %}
