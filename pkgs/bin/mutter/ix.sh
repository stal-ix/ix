{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/mutter/-/archive/43.1/mutter-43.1.tar.bz2
sha:65e3fd39c94bdfb8334c7e7df17e1ce6f4119f91cbed774a637764e8a6b92e75
{% endblock %}

{# hard X11 dep #}

{% block bld_libs %}
lib/c
lib/dbus
lib/udev
lib/glib
lib/gtk/3
lib/input
lib/wacom
lib/cairo
lib/pango
lib/lcms/2
lib/udev/g
lib/opengl
lib/colord
lib/wayland
lib/shim/x11
lib/canberra
lib/graphene
lib/xkbcommon
lib/json/glib
lib/drivers/3d
lib/mesa/gl/dl
lib/vulkan/loader
lib/mesa/glesv2/dl
lib/vulkan/headers
lib/gsettings/desktop/schemas
{% endblock %}

{% block bld_tool %}
bld/gettext
bld/wayland
bld/glib/codegen
{% endblock %}

{% block meson_flags %}
native_backend=false
glx=false
systemd=false
remote_desktop=false
libgnome_desktop=false
egl_device=false
wayland_eglstream=false
startup_notification=false
sm=false
introspection=false
cogl_tests=false
clutter_tests=false
core_tests=false
native_tests=false
tests=false
kvm_tests=false
tty_tests=false
profiler=false
opengl=false
udev=false
{% endblock %}

{% block patch %}
sed -e 's|ice_dep = .*||' \
    -e 's|have_x11 = .*|have_x11 = false|' \
    -e 's|have_xwayland = .*|have_xwayland = false|' \
    -e 's|have_x11_client = .*|have_x11_client = false|' \
    -i meson.build
{% endblock %}
