{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://github.com/swaywm/sway/archive/eaeb173a4b9b22d8ba1b35d3d863f0dcb8595341.zip
2bc3408393a1ff42d9065c9dd9070317
{% endblock %}

{% block bld_libs %}
lib/c

# drivers go first
lib/vulkan/driver
lib/mesa/drivers/gl/zink
#lib/mesa/drivers/gl/radeonsi

lib/pcre
lib/cairo
lib/pango
lib/json/c
lib/wayland
lib/wlroots/trunk
{% endblock %}

{% block bld_tool %}
bin/scdoc
lib/wayland/protocols
dev/build/meson/better
{% endblock %}

{% block c_rename_symbol %}
list_insert
seat_create
seat_destroy
server_init
zwp_linux_buffer_params_v1_interface
zwp_linux_dmabuf_feedback_v1_interface
zwp_linux_dmabuf_v1_interface
{% endblock %}
