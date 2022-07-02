{% extends '//die/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/mutter/-/archive/1f03a20939e05500d9d49c3078bb2839c2507fc7/mutter-1f03a20939e05500d9d49c3078bb2839c2507fc7.tar.bz2
sha:0401241f6400046e40966a7775db2a11d5fdc1a8f147898cd290e3a2b1ae9132
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
lib/udev/g
lib/opengl
lib/wayland
lib/x11shim
lib/canberra
lib/graphene
lib/xkbcommon
lib/drivers/3d
lib/mesa/gl/dl
lib/vulkan/loader
lib/mesa/glesv2/dl
lib/vulkan/headers
lib/gsettings/desktop/schemas
{% endblock %}

{% block bld_tool %}
bld/gettext
bld/glib/codegen
bin/wayland/protocols
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
sed -e 's|have_x11 = true|have_x11 = false|' \
    -e 's|have_xwayland = .*|have_xwayland = false|' \
    -e 's|ice_dep = .*||' \
    -i meson.build

sed -e 's|.*include.*X11.*||' -i src/meta/common.h
{% endblock %}
