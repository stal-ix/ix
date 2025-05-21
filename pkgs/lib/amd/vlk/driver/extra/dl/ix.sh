{% extends '//die/dl/fix.sh' %}

{% block export_prefix %}
wayproto_
{% endblock %}

{% block export_lib %}
wayland-client
{% endblock %}

{% block export_symbols %}
zwp_linux_dmabuf_v1_interface
zwp_linux_buffer_params_v1_interface
zwp_linux_dmabuf_feedback_v1_interface
wp_linux_drm_syncobj_manager_v1_interface
wp_linux_drm_syncobj_timeline_v1_interface
wp_linux_drm_syncobj_surface_v1_interface
{% endblock %}
