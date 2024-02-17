{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/YaLTeR/niri/archive/refs/tags/v0.1.2.tar.gz
{% endblock %}

{% block cargo_sha %}
46d2700d0ae283cac1e647c43d38dc8b6eaac4ebb9604e0b8e2927c99b0b3dc6
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
