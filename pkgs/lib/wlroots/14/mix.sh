{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/wlroots/wlroots/-/archive/0.14.1/wlroots-0.14.1.tar.bz2
7c8a3246e7ddb724bf7397a2f8f9b782
{% endblock %}

{% block lib_deps %}
lib/c/mix.sh
lib/drm/mix.sh
lib/udev/mix.sh
lib/seat/mix.sh
lib/input/mix.sh
lib/opengl/mix.sh
lib/pixman/mix.sh
lib/wayland/mix.sh
lib/xkbcommon/mix.sh
{% endblock %}

{% block bld_tool %}
lib/wayland/protocols/mix.sh
{% endblock %}

{% block meson_flags %}
-Dxwayland=disabled
-Drenderers=gles2
{% endblock %}

{% set redef %}
org_kde_kwin_idle_interface
org_kde_kwin_idle_timeout_interface
xdg_popup_interface
xdg_positioner_interface
xdg_surface_interface
xdg_toplevel_interface
xdg_wm_base_interface
zwlr_layer_shell_v1_interface
zwlr_layer_surface_v1_interface
wl_drm_interface
zwp_linux_dmabuf_v1_interface
zwp_linux_buffer_params_v1_interface
zwp_linux_dmabuf_feedback_v1_interface
{% endset %}

{% block setup %}
export CPPFLAGS="-DNSEC_PER_SEC=WLR_NSEC_PER_SEC ${CPPFLAGS}"

for x in {{redef.replace('\n', ' ')}}; do
    export CPPFLAGS="-D${x}=${x}_wlroots ${CPPFLAGS}"
done
{% endblock %}
