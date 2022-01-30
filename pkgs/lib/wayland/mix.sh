{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://wayland.freedesktop.org/releases/wayland-1.20.0.tar.xz
5095264157bf0565b921ceaf9d698d98
{% endblock %}

{% block lib_deps %}
lib/c
lib/ffi
{% endblock %}

{% block run_data %}
aux/adwaita/cursors
{% endblock %}

{% block bld_libs %}
lib/xml2
lib/expat
{% endblock %}

{% block bld_tool %}
{% if lib %}
lib/wayland
{% endif %}
{% endblock %}

{% if bin and host.id == target.id %}
{% block meson_cross %}
# disable cross
{% endblock %}
{% endif %}

{% block meson_flags %}
documentation=false
tests=false
{% endblock %}

{% block cpp_defines %}
XCURSORPATH=\\\"~/.icons:~/.cursors:${ADWAITA_CURSORS}\\\"
{% endblock %}

{% block install %}
{{super()}}

cd ${out}/lib/pkgconfig

{% if bin %}
rm wayland-client.pc \
   wayland-egl.pc    \
   wayland-cursor.pc \
   wayland-server.pc \
   wayland-egl-backend.pc

mv ${out}/lib/pkgconfig ${out}/share/
{% else %}
rm wayland-scanner.pc
{% endif %}
{% endblock %}
