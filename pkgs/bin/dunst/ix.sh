{% extends '//die/make.sh' %}

{% block fetch %}
https://github.com/dunst-project/dunst/archive/refs/tags/v1.8.1.tar.gz
sha:90325a4004626ce516ac7b5b0ed1aaab11c5315385d31f781d6f26064601c3a1
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
lib/pango
lib/cairo
lib/linux
lib/notify
lib/wayland
{% endblock %}

{% block bld_tool %}
bld/help2man
bld/pkg/config
bin/wayland/protocols
{% endblock %}

{% block patch %}
rm -rf src/x11; mkdir src/x11

cat << EOF > src/x11/screen.h
#define x_setup wl_init
#define x_free wl_deinit
#define x_win_create wl_win_create
#define x_win_destroy wl_win_destroy
#define x_win_show wl_win_show
#define x_win_hide wl_win_hide
#define x_display_surface wl_display_surface
#define x_win_get_context wl_win_get_context
#define get_active_screen wl_get_active_screen
#define x_is_idle wl_is_idle
#define have_fullscreen_window wl_have_fullscreen_window
#define x_get_scale wl_get_scale
EOF

cat << EOF > src/x11/x.h
#pragma once
struct keyboard_shortcut {
    const char *str;
    int code;
    int sym;
    int mask;
    bool is_valid;
};
EOF

echo 'pkg_config_packs := glib-2.0' >> config.mk
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
