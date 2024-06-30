{% extends '//die/c/meson.sh' %}

{% block git_repo %}
https://gitlab.gnome.org/GNOME/mutter
{% endblock %}

{% block git_commit %}
4134d12789df15094a6674684b21f8916b42546a
{% endblock %}

{% block git_sha %}
f4286f8a090ccbe4bf97f408364b4092cf6f6c8f0795f80d10eae9933c8b6614
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
lib/gdk/pixbuf
lib/xkb/common
lib/json/glib
lib/drivers/3d
lib/mesa/gl/dl
lib/vulkan/loader
lib/mesa/glesv2/dl
lib/vulkan/headers
lib/shim/fake/pkg(pkg_name=ice,pkg_ver=100.500)
lib/gsettings/desktop/schemas
{% endblock %}

{% block bld_tool %}
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

{% block patch %}
find . -type f -name 'meson.build' | while read l; do
    sed -e 's|.*logind_provider.*||' \
        -e 's|.* udev_dep = .*||' \
        -i ${l}
done
{% endblock %}
