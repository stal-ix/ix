{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/YaLTeR/niri/archive/refs/tags/v0.1.5.tar.gz
{% endblock %}

{% block cargo_sha %}
48e41a0f5d1a04eb5d0684b32af1b95cc0b18b649888ef55dcff64b7f81fd301
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
