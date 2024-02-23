{% extends '//die/go/build_v2.sh' %}

{% block go_url %}
https://github.com/u-root/u-root/archive/refs/tags/v0.13.0.tar.gz
{% endblock %}

{% block go_sha %}
29167a5cc9e583ab8297ae8f3dddd92c101e60b7f123c88aefa6aac875d81859
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp u-root ${out}/bin/
{% endblock %}
