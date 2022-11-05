{% extends 't/ix.sh' %}

{% block bld_tool %}
{{super()}}
bld/qt/6/wayland
{% endblock %}

{% block c_rename_symbol %}
{{super()}}
zwp_linux_dmabuf_v1_interface
zwp_linux_buffer_params_v1_interface
{% endblock %}
