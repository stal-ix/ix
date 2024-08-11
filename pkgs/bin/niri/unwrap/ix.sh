{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/YaLTeR/niri/archive/refs/tags/v0.1.8.tar.gz
{% endblock %}

{% block cargo_sha %}
cf0de268fd018cacabbfa6acdf5ba00f41677b531f204e03ef697a4eeda01de9
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
