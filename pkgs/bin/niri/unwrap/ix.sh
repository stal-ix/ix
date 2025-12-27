{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
niri
{% endblock %}

{% block version %}
25.11
{% endblock %}

{% block cargo_url %}
https://github.com/YaLTeR/niri/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
09d0a30b1ce2bf2a0876a7acfed88284fbea4a17334db415607915887dbb8fdd
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
bld/rust/91
{% endblock %}
