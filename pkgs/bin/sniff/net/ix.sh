{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
sniffnet
{% endblock %}

{% block version %}
1.4.0
{% endblock %}

{% block cargo_url %}
https://github.com/GyulyVGC/sniffnet/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
6ca127440284d13899aa4a422173760d84f2918774a7b34dc0ed587f4c87acdb
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
bld/rust/86
{% endblock %}
