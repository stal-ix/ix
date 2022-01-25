{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://github.com/swaywm/sway/archive/refs/tags/1.7.tar.gz
sha:0c64536fb2883ec518e75cfb119f9300115fb49b084e3fde62b794fe2c6c8d84
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
lib/wlroots/15
{% endblock %}

{% block bld_tool %}
bin/scdoc
bin/meson/better
lib/wayland/protocols
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
