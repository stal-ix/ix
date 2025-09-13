{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
niri
{% endblock %}

{% block version %}
25.08
{% endblock %}

{% block cargo_url %}
https://github.com/YaLTeR/niri/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
811391bf6524e42d2a59e769e9227a2ec4631f0477cbe81a5d35d6860fb93e9b
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
bld/rust/86
{% endblock %}
