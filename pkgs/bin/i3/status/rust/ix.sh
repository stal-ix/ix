{% extends '//die/rust/cargo_v2.sh' %}

{% block cargo_url %}
https://github.com/greshake/i3status-rust/archive/refs/tags/v0.33.0.tar.gz
{% endblock %}

{% block cargo_sha %}
33b94e150539fa30e6d4a610a0aaf6464ad2e7c64b3433fe8b51d71f3384e6e2
{% endblock %}

{% block bld_libs %}
lib/sensors
lib/openssl
{% endblock %}

{% block cargo_features %}
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/i3status-rs ${out}/bin/
{% endblock %}
