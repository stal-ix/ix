{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
niri
{% endblock %}

{% block version %}
25.05.1
{% endblock %}

{% block cargo_url %}
https://github.com/YaLTeR/niri/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
2f925f9c8ed713ba2f7bbfc740ba623225f57b6457fd6e78b0e6e988b8740659
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

{% block cargo_tool %}
bld/cargo/86
{% endblock %}
