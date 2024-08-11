{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/KarsMulder/evsieve/archive/refs/tags/v1.4.0.tar.gz
{% endblock %}

{% block cargo_sha %}
cdc0f12d784b7e04f527af5eef3bbfdf10037e270e3c1bd193e6b87cba39f922
{% endblock %}

{% block bld_libs %}
lib/c
lib/evdev
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/evsieve ${out}/bin/
{% endblock %}

