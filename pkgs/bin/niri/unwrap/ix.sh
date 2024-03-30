{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/YaLTeR/niri/archive/refs/tags/v0.1.4.tar.gz
{% endblock %}

{% block cargo_sha %}
bea5c2fbaca212a1434462dc3889fba748706d157dfce1b69fc36c85cd8ac1dd
{% endblock %}

{% block cargo_ver %}
v3
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
