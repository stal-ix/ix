{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/LouisBrunner/avahi2dns/archive/9349a6495ad4cafcd1d44e089b8ea2215165888e.zip
{% endblock %}

{% block go_sha %}
7bbc1e955aea85515fcb620d648ccc4d103855c8e96aa2f5efac2aabf00850c9
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp avahi2dns ${out}/bin/
{% endblock %}
