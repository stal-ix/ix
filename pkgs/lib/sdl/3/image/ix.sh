{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libsdl-org/SDL_image/archive/refs/tags/release-3.2.2.tar.gz
sha:29f5d94f7f0769655696feb615849d9ad610bab548ceab6a46c9511340be3d6e
{% endblock %}

{% block lib_deps %}
lib/c
lib/jxl
lib/png
lib/webp
lib/jpeg
lib/tiff
lib/avif
lib/sdl/3
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block cmake_flags %}
BUILD_SHARED_LIBS=ON
CMAKE_INSTALL_INCLUDEDIR=include
SDL3IMAGE_BUILD_SHARED_LIBS=ON
SDL3IMAGE_DEPS_SHARED=OFF
SDL3IMAGE_SAMPLES=OFF
SDL3IMAGE_WEBP=ON
SDL3IMAGE_AVIF=ON
{% endblock %}

{% block install %}
{{super()}}
test -f ${out}/lib/pkgconfig/SDL3_image.pc
{% endblock %}
