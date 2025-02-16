{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/YaLTeR/niri/archive/refs/tags/v25.01.tar.gz
{% endblock %}

{% block cargo_sha %}
314edcaa99ecba585644e5bff7af0dd5a0b747b21296f9c7cc5f159a60164b10
{% endblock %}

{% block rustc_ver %}
83
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
