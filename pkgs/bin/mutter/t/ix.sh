{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/mutter/-/archive/47.beta/mutter-47.beta.tar.bz2
sha:e24bbbf36f8372284da28ba2d4042949d0991a1dbdfccc45ca55f067ba97bf57
{% endblock %}

{% block bld_libs %}
lib/c
lib/ei
lib/atk
lib/dbus
lib/udev
lib/glib
lib/input
lib/wacom
lib/cairo
lib/pango
lib/lcms/2
lib/udev/g
lib/opengl
lib/colord
lib/wayland
lib/canberra
lib/graphene
lib/json/glib
lib/gdk/pixbuf
lib/xkb/common
lib/drivers/3d
lib/shim/systemd
lib/vulkan/loader
lib/vulkan/headers
lib/gsettings/desktop/schemas
lib/shim/fake/pkg(pkg_name=ice,pkg_ver=100.500)
lib/shim/fake/pkg(pkg_name=udev,pkg_ver=100.500)
lib/shim/fake/pkg(pkg_name=libelogind,pkg_ver=100.500)
{% endblock %}

{% block bld_tool %}
bin/mutter/exe
bin/cvt
bld/glib
bld/gettext
bld/wayland
{% endblock %}

{% block meson_flags %}
x11=false
wayland=true
xwayland=false
native_backend=true
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
tests=disabled
kvm_tests=false
tty_tests=false
profiler=false
opengl=false
udev_dir=${out}/share/udev
{% endblock %}

{% block build_flags %}
shut_up
wrap_cc
{% endblock %}
