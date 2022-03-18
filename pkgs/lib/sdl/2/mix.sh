{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/libsdl-org/SDL/archive/refs/tags/release-2.0.20.tar.gz
sha:2a026753af9b03fca043824bca8341f74921a836d28729e0c31aa262202a83c6
{% endblock %}

{% block lib_deps %}
lib/c
lib/decor
lib/jack/2
lib/opengl
lib/wayland
lib/xkbcommon
lib/vulkan/loader
{% endblock %}

{% block bld_tool %}
bin/pkg-config
bin/wayland/protocols
{% endblock %}

{% block cmake_flags %}
LIBTYPE=STATIC

SDL_STATIC=ON
SDL_SHARED=OFF

SDL_JACK=ON
SDL_JACK_SHARED=OFF

#SDL_ALSA=ON
#SDL_ALSA_SHARED=OFF

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
