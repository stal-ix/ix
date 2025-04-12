{% extends '//die/c/cmake.sh' %}

{% block version %}
2.8.8
{% endblock %}

{% block fetch %}
https://github.com/libsdl-org/SDL_image/archive/refs/tags/release-{{self.version().strip()}}.tar.gz
sha:2bd2c17cab3744ebfe7351ded8c70dc2078d8c7c24eb9f4ebb1b26a623e2a747
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
