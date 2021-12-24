{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://github.com/swaywm/sway/archive/eaeb173a4b9b22d8ba1b35d3d863f0dcb8595341.zip
2bc3408393a1ff42d9065c9dd9070317
{% endblock %}

{% block bld_libs %}
lib/c/mix.sh

# drivers go first
lib/vulkan/driver/mix.sh
lib/mesa/drivers/gl/zink/mix.sh
#lib/mesa/drivers/gl/radeonsi/mix.sh

lib/pcre/mix.sh
lib/cairo/mix.sh
lib/pango/mix.sh
lib/json/c/mix.sh
lib/wayland/mix.sh
lib/wlroots/trunk/mix.sh
{% endblock %}

{% block bld_tool %}
dev/doc/scdoc/mix.sh
lib/wayland/protocols/mix.sh
dev/build/meson/better/mix.sh
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
