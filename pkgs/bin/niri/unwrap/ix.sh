{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
niri
{% endblock %}

{% block version %}
26.04
{% endblock %}

{% block cargo_url %}
https://github.com/YaLTeR/niri/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
3a92792ea13febf0e6149890f504599a600497a2aa9b51242a85430e3400c31b
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
lib/xkb/common/dl
lib/display/info/old
lib/wayland/dl/server
{% endblock %}

{% block cargo_features %}
dbus
{% endblock %}

{% block cargo_bins %}
niri
{% endblock %}

{% block cargo_tool %}
bld/rust/96
{% endblock %}
