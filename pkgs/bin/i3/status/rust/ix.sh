{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
i3status-rust
{% endblock %}

{% block version %}
0.36.1
{% endblock %}

{% block cargo_url %}
https://github.com/greshake/i3status-rust/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
87e1901e11383a9047c27ac1aa1cf61d93e409222aae768faf4004a988e3dbd6
{% endblock %}

{% block bld_libs %}
lib/sensors
lib/openssl
{% endblock %}

{% block cargo_features %}
{% endblock %}

{% block cargo_bins %}
i3status-rs
{% endblock %}

{% block cargo_tool %}
bld/rust/96
{% endblock %}
