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

{% block c_rename_symbol %}
wl_buffer_interface
wl_callback_interface
wl_compositor_interface
wl_data_device_interface
wl_data_device_manager_interface
wl_data_offer_interface
wl_data_source_interface
wl_display_interface
wl_keyboard_interface
wl_output_interface
wl_pointer_interface
wl_region_interface
wl_registry_interface
wl_seat_interface
wl_shell_interface
wl_shell_surface_interface
wl_shm_interface
wl_shm_pool_interface
wl_surface_interface
wl_touch_interface
wl_subcompositor_interface
wl_subsurface_interface
{% endblock %}
