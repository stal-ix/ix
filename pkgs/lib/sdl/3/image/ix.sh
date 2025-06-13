{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
SDL_image
{% endblock %}

{% block version %}
3.2.4
{% endblock %}

{% block fetch %}
https://github.com/libsdl-org/SDL_image/archive/refs/tags/release-{{self.version().strip()}}.tar.gz
6a2f263e69d5cf0f218615e061f0d6cc1ae708e847ffe5372af98d5dd96bd037
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
SDLIMAGE_BUILD_SHARED_LIBS=ON
SDLIMAGE_DEPS_SHARED=OFF
SDLIMAGE_SAMPLES=OFF
SDLIMAGE_WEBP=ON
SDLIMAGE_AVIF=ON
SDLIMAGE_TIFF=ON
SDLIMAGE_JXL=ON
{% endblock %}

{% block install %}
{{super()}}
test -f ${out}/lib/pkgconfig/sdl3-image.pc
{% endblock %}
