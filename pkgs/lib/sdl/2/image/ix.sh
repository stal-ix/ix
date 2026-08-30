{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
SDL_image
{% endblock %}

{% block version %}
2.8.12
{% endblock %}

{% block fetch %}
https://github.com/libsdl-org/SDL_image/archive/refs/tags/release-{{self.version().strip()}}.tar.gz
26f07b431d09a9fb2cd759268030a1c34de44328d17f2a304f0612703a0d8cab
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
