{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libsdl-org/SDL/releases/download/release-2.26.3/SDL2-2.26.3.tar.gz
sha:c661205a553b7d252425f4b751ff13209e5e020b876bbfa1598494af61790057
{% endblock %}

{% block lib_deps %}
lib/c
lib/decor
lib/sndio
lib/opengl
lib/wayland
lib/xkbcommon
lib/vulkan/loader
{% endblock %}

{% block bld_tool %}
bld/wayland
bld/pkg/config
{% endblock %}

{% block cmake_flags %}
LIBTYPE=STATIC

SDL_STATIC=ON
SDL_SHARED=OFF

#SDL_JACK=ON
#SDL_JACK_SHARED=OFF

#SDL_ALSA=ON
#SDL_ALSA_SHARED=OFF

SDL_SNDIO=ON
SDL_SNDIO_SHARED=OFF

SDL_X11=OFF
SDL_VULKAN=ON
SDL_OPENGLES=ON

SDL_WAYLAND=ON
SDL_WAYLAND_SHARED=OFF
{% endblock %}

{% block cpp_defines %}
SDL_VIDEO_OPENGL_EGL=1
{% endblock %}

{% block patch %}
sed -e 's|CheckEGL()||' \
    -i CMakeLists.txt

sed -e 's|define SDL_DYNAMIC_API 1|define SDL_DYNAMIC_API 0|' \
    -i src/dynapi/SDL_dynapi.h
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
for x in lib/pkgconfig/sdl2.pc bin/sdl2-config; do
    sed -e 's|-l.*sndio.a|-lsndio|'  \
        -e 's|-l-.*sndio |-lsndio |' \
        -e 's|prefix}//.*|prefix}/lib|' \
        -i ${x}
done
{% endblock %}

{% block postinstall %}
{{super()}}
cd ${out}
mv lib/bin bin # or broke scummvm configure
{% endblock %}

{% block env %}
export SDL2_HEADERS=${out}/include/SDL2
{% endblock %}
