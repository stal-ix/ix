{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libsdl-org/SDL/archive/refs/tags/release-2.30.8.tar.gz
sha:ea638d142ee2bf71e2896fbc87e2eaa5956d2c91322aa55cf41049382a6e7730
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}

{% block cmake_flags %}
LIBTYPE=STATIC
SDL_STATIC=ON
SDL_SHARED=OFF
SDL_LIBSAMPLERATE=OFF
SDL_LIBSAMPLERATE_SHARED=OFF
{% endblock %}

{% block c_flags %}
-Wno-incompatible-function-pointer-types
{% endblock %}

{% block patch %}
sed -e 's|define SDL_DYNAMIC_API 1|define SDL_DYNAMIC_API 0|' \
    -i src/dynapi/SDL_dynapi.h
{% endblock %}

{% block postinstall %}
{{super()}}
cd ${out}
mv lib/bin bin # or broke scummvm configure
{% endblock %}

{% block env %}
export SDL2_LIBRARY=${out}/lib/libSDL2.a
export SDL2_HEADERS=${out}/include/SDL2
{% endblock %}
