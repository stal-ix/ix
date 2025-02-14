{% extends '//lib/sdl/3/t/ix.sh' %}

{% block lib_deps %}
lib/decor
lib/sndio
#lib/opengl
lib/wayland
lib/xkb/common
lib/vulkan/loader
{{super()}}
{% endblock %}

{% block bld_libs %}
lib/shim/fake(lib_name=EGL)
lib/shim/fake/pkg(pkg_name=egl,pkg_ver=100500)
{% endblock %}

{% block bld_tool %}
bld/wayland
{{super()}}
{% endblock %}

{% block cmake_flags %}
{{super()}}
SDL_VULKAN=ON
SDL_OPENGL=OFF
SDL_OPENGLES=OFF
SDL_OSS=OFF
SDL_ALSA=OFF
SDL_ALSA_SHARED=OFF
SDL_SNDIO=ON
SDL_SNDIO_SHARED=OFF
SDL_X11=OFF
SDL_WAYLAND=ON
SDL_WAYLAND_SHARED=OFF
SDL_PIPEWIRE=OFF
SDL_PIPEWIRE_SHARED=OFF
SDL_PULSEAUDIO=OFF
SDL_PULSEAUDIO_SHARED=OFF
{% endblock %}

{% block cpp_defines %}
{{super()}}
SDL_VIDEO_OPENGL_EGL=1
{% endblock %}

{% block install %}
{{super()}}
find ${out}/lib/pkgconfig -type f | while read l; do
    sed -e 's| egl ||g' -i ${l}
done
{% endblock %}
