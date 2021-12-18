{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://wayland.freedesktop.org/releases/wayland-1.20.0.tar.xz
5095264157bf0565b921ceaf9d698d98
{% endblock %}

{% block lib_deps %}
lib/c/mix.sh
lib/ffi/mix.sh
{% endblock %}

{% block bld_libs %}
lib/xml2/mix.sh
lib/expat/mix.sh
{% endblock %}

{% block bld_tool %}
{% if kind == 'lib' %}
lib/wayland/mix.sh
{% endif %}
{% endblock %}

{% if kind == 'bin' and host.id == target.id %}
{% block meson_cross %}
# disable cross
{% endblock %}
{% endif %}

{% block meson_flags %}
-Ddocumentation=false
-Dtests=false
{% endblock %}

{% block install %}
{{super()}}

cd ${out}/lib/pkgconfig

{% if kind == 'bin' %}
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
