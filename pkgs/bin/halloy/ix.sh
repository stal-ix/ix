{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/squidowl/halloy/archive/refs/tags/2025.1.tar.gz
{% endblock %}

{% block cargo_sha %}
c402e6dce7f078a314fbeedac8f30c233a7d6065ad08cac5221e5e98ee9c5013
{% endblock %}

{% block rustc_ver %}
83
{% endblock %}

{% block cargoc_ver %}
80
{% endblock %}

{% block bld_libs %}
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
