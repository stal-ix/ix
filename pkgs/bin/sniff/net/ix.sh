{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
sniffnet
{% endblock %}

{% block version %}
1.3.2
{% endblock %}

{% block cargo_url %}
https://github.com/GyulyVGC/sniffnet/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
1e5ec4a0fba2267f9f5a30bb5ebc7e6b36762465149a7fe7d77b7e42099bca37
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

{% block cargo_tool %}
bld/cargo/86
{% endblock %}
