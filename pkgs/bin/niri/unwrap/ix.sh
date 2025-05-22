{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
niri
{% endblock %}

{% block version %}
25.05
{% endblock %}

{% block cargo_url %}
https://github.com/YaLTeR/niri/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
84cdfa309d10f1b43b40197b5543865a8ddafe4a08e5f1d9fea02a7d70e22fee
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

{% block cargoc_ver %}
bld/cargo/86
{% endblock %}
