{% extends '//lib/gtk/t/ix.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gtk/-/archive/4.12.2/gtk-4.12.2.tar.bz2
sha:7da9863d8d76ee9c4f27d1bef6041426b98430e6d6984d2708d1a41971e1839c
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/vulkan/loader
{% endblock %}

{% block bld_tool %}
bin/glslc
bin/sassc
{{super()}}
{% endblock %}

{% block meson_flags %}
demos=false
vulkan=enabled
x11-backend=false
build-tests=false
build-examples=false
build-testsuite=false
media-ffmpeg=disabled
media-gstreamer=disabled
{% endblock %}

{% block patch %}
{{super()}}
patch -p1 << EOF
{% include '0.diff' %}
EOF
{% endblock %}

{% block env %}
export CMFLAGS="-DUSE_GTK4=ON \${CMFLAGS}"
export CPPFLAGS="-I${out}/include/gtk-4.0 \${CPPFLAGS}"
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|wayland-protocols.*,||' -i ${out}/lib/pkgconfig/gtk4.pc
{% endblock %}

{% block c_rename_symbol %}
{{super()}}
wl_cursor_image_get_buffer
wl_cursor_theme_destroy
wl_cursor_theme_get_cursor
xcursor_images_destroy
g_openuri_portal_open_uri_async
g_openuri_portal_open_uri_finish
{% endblock %}
