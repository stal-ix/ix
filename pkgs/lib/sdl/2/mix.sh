{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/libsdl-org/SDL/archive/refs/tags/release-2.0.20.tar.gz
sha:2a026753af9b03fca043824bca8341f74921a836d28729e0c31aa262202a83c6
{% endblock %}

{% block lib_deps %}
lib/c
lib/opengl
lib/wayland
lib/alsa/lib
lib/xkbcommon
lib/vulkan/loader
{% endblock %}

{% block bld_tool %}
dev/build/pkg-config
lib/wayland/protocols
{% endblock %}

{% block cmake_flags %}
LIBTYPE=STATIC
SDL_WAYLAND=ON
SDL_X11=OFF
SDL_VULKAN=ON
SDL_SHARED=OFF
SDL_STATIC=ON
SDL_OPENGLES=ON
SDL_WAYLAND_SHARED=OFF
{% endblock %}

{% block setup %}
export CPPFLAGS="-DSDL_VIDEO_OPENGL_EGL=1 ${CPPFLAGS}"
{% endblock %}

{% block patch %}
sed -e 's|CheckEGL()||' \
    -i CMakeLists.txt

sed -e 's|define SDL_DYNAMIC_API 1|define SDL_DYNAMIC_API 0|' \
    -i src/dynapi/SDL_dynapi.h
{% endblock %}
