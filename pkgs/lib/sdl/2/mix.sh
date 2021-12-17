{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/libsdl-org/SDL/archive/refs/tags/release-2.0.18.tar.gz
647e2890385e5f13b9aeee2e27fa26e7
{% endblock %}

{% block lib_deps %}
lib/c/mix.sh
lib/opengl/mix.sh
lib/wayland/mix.sh
lib/xkbcommon/mix.sh
lib/vulkan/loader/mix.sh
{% endblock %}

{% block bld_tool %}
dev/build/pkg-config/mix.sh
lib/wayland/protocols/mix.sh
{% endblock %}

{% block cmake_flags %}
-DLIBTYPE=STATIC
-DSDL_WAYLAND=ON
-DSDL_X11=OFF
-DSDL_VULKAN=ON
-DSDL_SHARED=OFF
-DSDL_STATIC=ON
-DSDL_OPENGLES=ON
-DSDL_WAYLAND_SHARED=OFF
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
