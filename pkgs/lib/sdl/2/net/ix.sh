{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libsdl-org/SDL_net/archive/refs/tags/release-2.2.0.tar.gz
sha:08d741282c0c22b82ed134f09cd319803132289cae06fb47b5ada2752faf0493
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/sdl/2
{% endblock %}

{% block cmake_flags %}
CMAKE_INSTALL_LIBDIR=lib
SDL2NET_SAMPLES=OFF
BUILD_SHARED_LIBS=ON
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block step_install %}
{{super()}}
sed -e 's|libSDL2_net-2.0.a|libSDL2_net.a|' -i ${out}/lib/cmake/SDL2_net/SDL2_net-shared-targets-release.cmake
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/SDL2 \${CPPFLAGS}"
{% endblock %}
