{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/wayland/weston/-/archive/f2452d600617a4789e202c06d6d1055ace82258f/weston-f2452d600617a4789e202c06d6d1055ace82258f.tar.bz2
ad4863a7d87afcc3f63e9f646a934d99981cef2ae6106afe524d30ac84731c7f
{% endblock %}

{% block bld_libs %}
lib/c
lib/gbm
lib/pam
lib/seat
lib/webp
lib/jpeg
lib/pango
lib/cairo
lib/input
lib/lcms/2
lib/pixman
lib/opengl
lib/wayland
lib/xkb/common
lib/shim/gnu/basename/overlay
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}

{% block meson_flags %}
launcher-libseat=true
launcher-logind=false

systemd=false
xwayland=false
remoting=false
pipewire=false
color-management-colord=false

backend-rdp=false
backend-x11=false
backend-drm-screencast-vaapi=false
{% endblock %}

{% block c_rename_symbol %}
os_create_anonymous_file
{% endblock %}

{% block install %}
{{super()}}
rm -rf ${out}/share/pkgconfig
{% endblock %}
