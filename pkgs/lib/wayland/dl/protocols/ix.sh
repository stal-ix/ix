{% extends '//die/c/premain.sh' %}

{% block lib_deps %}
lib/dlfcn
lib/wayland
{% endblock %}

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

{% block premain_code %}
#include <dlfcn.h>
#include <wayland-client-protocol.h>

__attribute__((__constructor__))
void init_wayland_protocol() {
{% for x in ix.parse_list(self.export_symbols()) %}
    stub_dlregister("wayland-protocols", "{{x}}", (void*)&{{x}});
{% endfor %}
}
{% endblock %}
