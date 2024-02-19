{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/greshake/i3status-rust/archive/refs/tags/v0.33.0.tar.gz
{% endblock %}

{% block cargo_sha %}
73232f55d13d9160b3706ad659c39a417f5688aaa112a3d4a3214397c6c6b16b
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
