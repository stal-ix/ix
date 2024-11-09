{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/optozorax/car_drift/archive/8fbfd0f82f614d9d32bbf78176b77e98affdadcb.zip
{% endblock %}

{% block cargo_sha %}
2d08b0d8244ef9259629ee6a0e40c1898c3461fba27e700a03fa630d77ef0c55
{% endblock %}

{% block cargo_ver %}
v4
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/eframe_template ${out}/bin/car_drift
{% endblock %}
