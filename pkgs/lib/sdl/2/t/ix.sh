{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libsdl-org/SDL/archive/refs/tags/release-2.30.2.tar.gz
sha:b7c22ec5180acf8fd193aa0d828bde5c9910b56a9231ef92f32f16f682a054ab
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

{% block setup_target_flags %}
export CFLAGS="-Wno-incompatible-function-pointer-types ${CFLAGS}"
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
