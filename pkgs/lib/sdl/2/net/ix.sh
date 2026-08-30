{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
SDL_net
{% endblock %}

{% block version %}
2.4.0
{% endblock %}

{% block fetch %}
https://github.com/libsdl-org/SDL_net/archive/refs/tags/release-{{self.version().strip()}}.tar.gz
0d26aa8c945644b39e1b3cd21b692ed1332eba2bdc623a383bfbc4b2be6e76d3
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/sdl/2
{% endblock %}

{% block cmake_flags %}
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
