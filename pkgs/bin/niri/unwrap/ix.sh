{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/YaLTeR/niri/archive/refs/tags/v25.02.tar.gz
{% endblock %}

{% block cargo_sha %}
3a25af6b676f2ccbe2b9f0a2df438d104a10b911aec19b04170d6a3d5279cf4e
{% endblock %}

{% block lib_deps %}
lib/gbm
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
