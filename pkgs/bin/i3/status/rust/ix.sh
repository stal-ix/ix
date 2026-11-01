{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
i3status-rust
{% endblock %}

{% block version %}
0.36.2
{% endblock %}

{% block cargo_url %}
https://github.com/greshake/i3status-rust/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
d303d08839c8f35876906f6fdb6281d660dbaa7f961922ae0b3d41f394448153
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
