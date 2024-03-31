{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/LouisBrunner/avahi2dns/archive/9349a6495ad4cafcd1d44e089b8ea2215165888e.zip
{% endblock %}

{% block go_sha %}
c88ea94823aa15625f23b7401c0b0d2138ddffea016828b148328c3d9e27f2c4
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp avahi2dns ${out}/bin/
{% endblock %}

{% block go_version %}
v3
{% endblock %}
