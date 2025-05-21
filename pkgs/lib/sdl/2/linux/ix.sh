{% extends '//lib/sdl/2/t/ix.sh' %}

{% block lib_deps %}
lib/decor
lib/sndio
lib/sdl/gl
lib/wayland
lib/xkb/common
{% if vulkan %}
lib/vulkan/loader
{% endif %}
{{super()}}
{% endblock %}

{% block bld_tool %}
bld/wayland
{{super()}}
{% endblock %}

{% block cmake_flags %}
{{super()}}
SDL_OSS=OFF
SDL_ALSA=OFF
SDL_ALSA_SHARED=OFF
SDL_SNDIO=ON
SDL_SNDIO_SHARED=OFF
SDL_X11=OFF
{% if vulkan %}
SDL_VULKAN=ON
{% else %}
SDL_VULKAN=OFF
{% endif %}
SDL_WAYLAND=ON
SDL_WAYLAND_SHARED=OFF
SDL_PIPEWIRE=OFF
SDL_PIPEWIRE_SHARED=OFF
SDL_PULSEAUDIO=OFF
SDL_PULSEAUDIO_SHARED=OFF
{% endblock %}

{% block install %}
{{super()}}
for x in ${out}/lib/pkgconfig/sdl2.pc ${out}/bin/sdl2-config; do
    sed -e 's|-l.*sndio.a|-lsndio|'  \
        -e 's|-l-.*sndio |-lsndio |' \
        -e 's|-l-L.*|-lsndio|' \
        -e 's|prefix}//.*|prefix}/lib|' \
        -i ${x}
done
{% endblock %}
