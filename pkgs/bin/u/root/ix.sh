{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/u-root/u-root/archive/refs/tags/v0.13.0.tar.gz
{% endblock %}

{% block go_sha %}
8d4df384a05b27cd56e8a9cb9be56f500ceab4cbd3a0b68663657716adc3bba7
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp u-root ${out}/bin/
{% endblock %}
