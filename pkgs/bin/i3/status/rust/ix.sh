{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/greshake/i3status-rust/archive/refs/tags/v0.33.0.tar.gz
{% endblock %}

{% block cargo_sha %}
1db61f3eab477cc9eedb8c0b33eb2d3dc18e72a5a80551b15fcee862be527501
{% endblock %}

{% block bld_libs %}
lib/sensors
lib/openssl
{% endblock %}

{% block cargo_features %}
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/i3status-rs ${out}/bin/
{% endblock %}
