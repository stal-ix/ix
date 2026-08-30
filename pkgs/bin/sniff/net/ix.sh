{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
sniffnet
{% endblock %}

{% block version %}
1.5.1
{% endblock %}

{% block cargo_url %}
https://github.com/GyulyVGC/sniffnet/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
81519a58bc826c8446d903ab3c896fc21952bd1bfc1712c7f5f209f0ae54a27d
{% endblock %}

{% block bld_libs %}
lib/alsa
lib/pcap
lib/wayland/dl
lib/drivers/3d
lib/xkb/common/dl
{% endblock %}

{% block cargo_bins %}
sniffnet
{% endblock %}

{% block cargo_tool %}
bld/rust/96
{% endblock %}
