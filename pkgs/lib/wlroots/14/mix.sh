{% extends '//mix/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/wlroots/wlroots/-/archive/0.14.1/wlroots-0.14.1.tar.bz2
7c8a3246e7ddb724bf7397a2f8f9b782
{% endblock %}

{% block lib_deps %}
lib/c
lib/drm
lib/udev
lib/seat
lib/input
lib/opengl
lib/pixman
lib/wayland
lib/xkbcommon
lib/mesa/glesv2
{% endblock %}

{% block bld_tool %}
bin/wayland/protocols
{% endblock %}

{% block meson_flags %}
xwayland=disabled
renderers=gles2
{% endblock %}

{% block c_rename_symbol %}
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

NSEC_PER_SEC
{% endblock %}

{% block patch %}
>xcursor/xcursor.c
{% endblock %}
