{% extends '//die/dl/fix.sh' %}

{% block export_symbols %}
wl_buffer_destroy
wl_display_dispatch
wl_display_get_registry
wl_display_roundtrip
wl_display_sync
wl_registry_add_listener
wl_registry_bind
wl_shm_create_pool
wl_shm_interface
wl_shm_pool_create_buffer
wl_shm_pool_destroy
wl_surface_attach
wl_surface_commit
wl_surface_damage
{% endblock %}

{% block export_lib %}
wayland-protocols
{% endblock %}
