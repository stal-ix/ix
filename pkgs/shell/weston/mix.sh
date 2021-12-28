{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/wayland/weston/-/archive/f2452d600617a4789e202c06d6d1055ace82258f/weston-f2452d600617a4789e202c06d6d1055ace82258f.tar.bz2
7fe0bc85dc05f5f0e2322bfb82bd2bfd
{% endblock %}

{% block bld_libs %}
lib/c
lib/pam
lib/seat
lib/webp
lib/jpeg
lib/pango
lib/lcms2
lib/cairo
lib/input
lib/pixman
lib/opengl
lib/wayland
lib/xkbcommon
{% endblock %}

{% block bld_tool %}
lib/wayland/protocols
{% endblock %}

{% block meson_flags %}
-Dlauncher-libseat=true
-Dlauncher-logind=false

-Dsystemd=false
-Dxwayland=false
-Dremoting=false
-Dpipewire=false
-Dcolor-management-colord=false

-Dbackend-rdp=false
-Dbackend-x11=false
-Dbackend-drm-screencast-vaapi=false
{% endblock %}

{% block c_rename_symbol %}
os_create_anonymous_file
{% endblock %}

{% block install %}
{{super()}}
rm -rf ${out}/share/pkgconfig
{% endblock %}
