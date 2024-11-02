{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/YaLTeR/niri/archive/refs/tags/v0.1.9.tar.gz
{% endblock %}

{% block cargo_sha %}
46584aa2638daee532809f35f5e63c6d036f54a86c30a97a7ffa7223898f4b03
{% endblock %}

{% block lib_deps %}
lib/seat
lib/udev
lib/glib
lib/pango
lib/cairo
lib/input
lib/bzip/2
lib/opengl
lib/drivers/3d
lib/wayland/dl
lib/mesa/egl/dl
lib/display/info
lib/xkb/common/dl
lib/wayland/dl/server
{% endblock %}

{% block cargo_features %}
dbus
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/niri ${out}/bin/
{% endblock %}
