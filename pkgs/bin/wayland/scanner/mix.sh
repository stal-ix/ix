{% extends '//lib/wayland/t/mix.sh' %}

{% if host.id == target.id %}
{% block meson_cross %}
# disable cross
{% endblock %}
{% endif %}

{% block install %}
{{super()}}

cd ${out}/lib/pkgconfig

rm wayland-client.pc \
   wayland-egl.pc    \
   wayland-cursor.pc \
   wayland-server.pc \
   wayland-egl-backend.pc

mv ${out}/lib/pkgconfig ${out}/share/
{% endblock %}
