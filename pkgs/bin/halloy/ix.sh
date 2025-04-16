{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
halloy
{% endblock %}

{% block version %}
2025.4
{% endblock %}

{% block cargo_url %}
https://github.com/squidowl/halloy/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
8058f54ef893deb96d1385d677210
{% endblock %}

{% block cargoc_ver %}
bld/cargo/80
{% endblock %}

{% block bld_libs %}
lib/z
lib/xz
lib/zstd
lib/alsa
lib/opengl
lib/openssl
lib/wayland/dl
lib/drivers/3d
lib/xkb/common/dl
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/halloy ${out}/bin/
{% endblock %}
