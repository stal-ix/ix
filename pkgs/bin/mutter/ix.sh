{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/mutter/-/archive/44.beta/mutter-44.beta.tar.bz2
sha:f12ad67bd040a22073541783818eb2c33b612ef2abaa8b8474286b28871ee79c
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
bld/glib
bld/gettext
bld/wayland
{% endblock %}

{% block meson_flags %}
wayland=true
xwayland=false
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
    -i meson.build
{% endblock %}
