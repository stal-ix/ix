{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/GyulyVGC/sniffnet/archive/refs/tags/v1.3.2.tar.gz
{% endblock %}

{% block cargo_sha %}
1f1589fa2f545a23c0ccaf191caeb4cc98bb14633f512fe2db399e029d887500
{% endblock %}

{% block bld_libs %}
lib/alsa
lib/pcap
lib/wayland/dl
lib/drivers/3d
lib/xkb/common/dl
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/sniffnet ${out}/bin
{% endblock %}

{% block cargoc_ver %}
bld/cargo/83
{% endblock %}
