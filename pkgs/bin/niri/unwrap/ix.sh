{% extends '//die/rust/cargo_v2.sh' %}

{% block cargo_url %}
https://github.com/YaLTeR/niri/archive/refs/tags/v0.1.2.tar.gz
{% endblock %}

{% block cargo_sha %}
f4dbde12c6c6208d092d0049093086f69403c620628d92d324efe0bfd9a27f2c
{% endblock %}

{% block lib_deps %}
lib/seat
lib/udev
lib/glib
lib/pango
lib/cairo
lib/input
lib/opengl
lib/drivers/3d
lib/wayland/dl
lib/mesa/egl/dl
lib/xkb/common/dl
lib/wayland/dl/server
{% endblock %}

{% block cargo_features %}
dbus
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/niri ${out}/bin/
{% endblock %}
